//
//  NetworkManager.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/5/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation
import Yarp
/**
 This show an example of an Network Manager that serve a single base URL.
 If post-login auth (for instance, through a POST with an email / password login) sends back a token,
 an example of adding it to a header is shown below (in this case, with a Bearer token).
 */

public class NetworkManager: INetworkManager {
    internal let baseURL: String
    /// ---
    /// An instance of Yarp to keep reachability status up to date.

    private let yarp: Yarp?
    /// ---
    /// The default URLSession for network communications

    let defaultSession = URLSession(configuration: .default) // maybe .background?

    /// ---
    /// An array of dataTasks currently being managed. Tasks should be added when they start, and removed
    /// when finished.

    private var dataTasks: [URLSessionDataTask?] = []
    /// ---
    /// An array of downloadTasks currently being managed. Tasks should be added when they start, and
    /// removed when finished.

    private var downloadTasks: [URLSessionDownloadTask?] = []

    private (set) var isReachable: Bool = false

    /// ---
    /// An example of storing a bearer token as a property to be used in authenticated calls
    /// If not nil, it will be added as an Authentication field to the request headers

    public var bearerToken: String?

    required init(baseURL: String) {
        self.baseURL = baseURL
        self.yarp = Yarp.init(hostName: baseURL)
        self.yarp?.addHandler("NetworkManager", handler: { (yarp: Yarp) in {[weak self] in
            if let reachable: Bool = yarp.isReachable {
                self?.isReachable = reachable
            }
            }()
        })
        self.yarp?.start()
    }

    deinit {
        yarp?.removeAllHandlers()
        yarp?.stop()
    }

    func shutdown() {
        for dataTask: URLSessionDataTask? in dataTasks { dataTask?.cancel() }
        for downloadTask: URLSessionDownloadTask? in downloadTasks { downloadTask?.cancel() }
        self.yarp?.removeAllHandlers()
        self.yarp?.stop()
    }

    /**
     Remove a reference to a data task from NetworkManager's dataTasks property

     - parameter dataTask: URLSessionsDataTask? - an optional instance of a data task that
     may be held as a reference in the NetworkManagers dataTasks property.
     */

    internal func cleanupDataTask(dataTask: URLSessionDataTask?) {
        if let dataTask: URLSessionDataTask = dataTask,
           let idx: Int = dataTasks.firstIndex(of: dataTask) {
            dataTasks.remove(at: idx)
        }
    }
    /**
     Remove a reference to a download task from NetworkManager's downloadTasks property

     - parameter dataTask: URLSessionDownloadTask? - an optional instance of a download task that
     may be held as a reference in the NetworkManagers dataTasks property.
     */
    internal func cleanupDownloadTask(downloadTask: URLSessionDownloadTask?) {
        if let downloadTask: URLSessionDownloadTask = downloadTask,
           let idx: Int = downloadTasks.firstIndex(of: downloadTask) {
            downloadTasks.remove(at: idx)
        }
    }

    /**
     Does the initial processing of a response, looking for common error codes. If the response shows
     success, an attempt is made to create a JSONArray or JSONDictionary.

     - parameter response: URLResponse? - an optional response to parse
     - parameter data: Data? - optional data to parse
     - Returns: a tuple containing an optional JSONArray or JSONDictionary, and, if case of failure, and Error
     */
    internal func processResponse(response: URLResponse?) -> Error? {
        var returnError: Error? = nil
        if let response = response as? HTTPURLResponse {
            if let error = NetworkManagerError(rawValue: response.statusCode) {
                returnError = error.error
            }
        }
        return returnError
    }

    public func callToPath(path: String,
                           verb: HTTPVerb,
                           parameters: JSONDictionary?,
                           completion: @escaping NetworkManagerCallCompletion) {

        let (optRequest, error) = newRequestWithBody(method: verb.verbString, path: path, parameters: parameters)
        guard let request: URLRequest = optRequest, error == nil else {
            completion(nil, error)
            return
        }
        var dataTask: URLSessionDataTask? = nil
        dataTask = defaultSession.dataTask(with: request) { data, response, error in
            defer { self.cleanupDataTask(dataTask: dataTask) }
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
            else if let responseError = self.processResponse(response: response) { //possibly still useable intel from BE
                DispatchQueue.main.async {
                    completion(data, responseError)
                }
            }
            else {
                DispatchQueue.main.async { //looks like good data
                    completion(data, nil)
                }
            }

        }
        if let dataTask: URLSessionDataTask = dataTask {
            dataTasks.append(dataTask)
            dataTask.resume()
        }
    }

    public func callToPathParsed<T: Codable>(path: String,
                           verb: HTTPVerb,
                           parameters: JSONDictionary?,
                           completion: @escaping NetworkManagerCallCompletionParsed<T>) {

        let (optRequest, error) = newRequestWithBody(method: verb.verbString, path: path, parameters: parameters)
        guard let request: URLRequest = optRequest, error == nil else {
            completion(nil, nil, error)
            return
        }
        var dataTask: URLSessionDataTask? = nil
        dataTask = defaultSession.dataTask(with: request) { data, response, error in
            defer { self.cleanupDataTask(dataTask: dataTask) }

            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, data, error)
                }
            }
            else if let responseError = self.processResponse(response: response) { //possibly still useable intel from BE
                DispatchQueue.main.async {
                    completion(nil, data, responseError)
                }
            }
            else if let data = data {
                if let parsedData: T = try? JSONDecoder().decode(T.self, from: data) {
                    DispatchQueue.main.async { //looks like good data
                        completion(parsedData, data, nil)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completion(nil, data, NetworkManagerError.badData.error)
                    }
                }
            }
        }
        if let dataTask: URLSessionDataTask = dataTask {
            dataTasks.append(dataTask)
            dataTask.resume()
        }
    }

    /**
     Attemtps to copy a file from a temp location to a permanent one

     - parameter tempLocation: URL - the URL of the temporary location of the file
     - parameter saveToLocation: String - the location to store the the download to. If a file already
     exists at this location, it WILL be deleted if 'force' is true
     - prameter force: Bool - forces the file copying if a file exists at the saveToLocation path

     - Returns: a tuple specificying success and an optional error on failure
     */
    private func copyFile(tempLocation: URL, saveToLocation: String, force: Bool) -> (Bool, Error?) {
        // copy to a permanent URL
        let fileManager: FileManager = FileManager.default
        if fileManager.fileExists(atPath: tempLocation.absoluteString) {
            let saveToURL: URL = URL(fileURLWithPath: saveToLocation)
            if fileManager.fileExists(atPath: saveToLocation) {
                if force {
                    do {
                        try fileManager.removeItem(at: saveToURL)
                    } catch let removeError {
                        return (false, removeError)
                    }
                } else {
                    return (false, NetworkManagerError.fileExistsError.error)
                }
            }
            do {
                try fileManager.copyItem(at: tempLocation, to: saveToURL)
            } catch {
                return (false, NetworkManagerError.fileCopyError.error)
            }
        } else {
            return (false, NetworkManagerError.fileCopyError.error)
        }
        return (true, nil)
    }

    internal func downloadResourceAtURL(resourceURL: String,
                                        saveToLocation: String,
                                        force: Bool,
                                        completion: @escaping NetworkManagerDownloadCompletion) {
        if URLComponents(string: resourceURL) != nil {
            let (optRequest, error) = newRequest(method: "GET", path: resourceURL)
            guard let request: URLRequest = optRequest, error == nil else {
                completion(false, error)
                return
            }
            var downloadTask: URLSessionDownloadTask?
            downloadTask = defaultSession.downloadTask(
                with: request,
                completionHandler: { (tempLocation: URL?, _, error: Error?) in
                    defer { self.cleanupDownloadTask(downloadTask: downloadTask) }
                    guard error != nil else {
                        completion(false, error)
                        return
                    }
                    guard let tempLocation: URL = tempLocation else {
                        completion(false, NetworkManagerError.downloadCouldNotBeSavedToDisk.error)
                        return
                    }
                    let (success, copyError) = self.copyFile(tempLocation: tempLocation,
                                                        saveToLocation: saveToLocation,
                                                        force: force)
                    completion(success, copyError)

            })
            if let downloadTask: URLSessionDownloadTask = downloadTask {
                downloadTasks.append(downloadTask)
                downloadTask.resume()
            }
        }
    }
}

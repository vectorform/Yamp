//
//  INetworkManager.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/20/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation

protocol INetworkManager {
    /// ---
    /// a property that should reveal current reachability
    var isReachable: Bool { get }

    init(baseURL: String)

    /**
     Stops all current data and file download tasks
     */
    func shutdown()

    /**
     Creates and runs a general HTTP method that takes a path/verb and a completion block for returning a JSON object

     - parameter path: String - a complete or relative path for the GET request
     - parameter verb: HTTPVerb - the http verb to be used to make the call.
     - parameter parameters: JSONDictionary? - an optional JSONDictionary to use as the query string
     - parameter completion: NetworkManagerGetObjectCompletion block
     */
    func callToObject(path: String,
                      verb: HTTPVerb,
                      parameters: JSONDictionary?,
                      completion: @escaping NetworkManagerCallCompletion )

    /**
     Creates and runs a general HTTP method that takes a path and a completion block for returning an Array of JSON objects

     - parameter path: String - a complete or relative path for the GET request
     - parameter verb: HTTPVerb - the http verb to be used to make the call.
     - parameter parameters: JSONDictionary? - an optional JSONDictionary to use as the query string
     - parameter completion: NetworkManagerGetArrayCompletion block
     */
    func callToArray(path: String,
                     verb: HTTPVerb,
                     parameters: JSONDictionary?,
                     completion: @escaping NetworkManagerCallArrayCompletion )

    /**
     Creates and runs a general GET method that takes a path to a resource at a URL, a path to save the
     download to, and a completion block that will notify of success or failure

     - parameter resourceURL: String - a complete or relative path for the GET request
     - parameter saveToLocation: String - the location to store the the download to. If a file already
     exists at this location, it WILL be deleted if 'force' is true
     - prameter force: Bool - forces the file copying if a file exists at the saveToLocation path
     - parameter completion: NetworkManagerGetObjectCompletion block
     */

     func downloadResourceAtURL(resourceURL: String,
                                saveToLocation: String,
                                force: Bool,
                                completion: @escaping NetworkManagerDownloadCompletion)
}

public typealias JSONDictionary = [String: Any]
public typealias JSONArray = [Any]
public typealias NetworkManagerCallCompletion = (_: JSONDictionary?, _ : Error?) -> Void
public typealias NetworkManagerCallArrayCompletion = (_: JSONArray?, _ : Error?) -> Void
public typealias NetworkManagerLoginCompletion = (_: Bool, _ : Error?) -> Void
public typealias NetworkManagerDownloadCompletion = (_: Bool, _ : Error?) -> Void

enum NetworkManagerError: Int, CustomStringConvertible, CustomErrorConvertible {
    case malformedURL = 1000, malformedJSON, tokenFailure, jsonParseError, badData,
    missingArray, missingObject, downloadCouldNotBeSavedToDisk, fileCopyError, fileExistsError,
    notAuthenticated, notAuthorized, serverError, resourceNotFound

    var domain: String {
        return "NetworkManagerError"
    }

    var description: String {
        switch self {
        case .malformedURL:             return "A URL could not be created"
        case .malformedJSON:            return "A JSON body could not be created"
        case .tokenFailure:             return "A valid token wasn't returned on login"
        case .jsonParseError:           return "The data returned could not be parsed to JSON"
        case .badData:                  return "The data returned could not be parsed"
        case .missingArray:             return "The data returned could not be parsed into an Array"
        case .missingObject:            return "The data returned could not be parsed into an Object"
        case .downloadCouldNotBeSavedToDisk: return "A download failed to save to disk"
        case .fileCopyError:            return "A downloaded file failed to copy to a permanaent location"
        case .fileExistsError:
            return "A file failed to copy to a permanaent location. A file already exists at the destination path"
        case .notAuthenticated:         return "Authentication failure"
        case .notAuthorized:            return "User is not authorized to perform this action"
        case .serverError:              return "An error occurred on the server"
        case .resourceNotFound:         return "A specificed resource was not found"
        }
    }
}

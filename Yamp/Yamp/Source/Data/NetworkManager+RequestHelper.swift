//
//  NetworkManager+RequestHelper.swift
//  VFMVPBase
//
//  Created by Joshua Parmenter on 5/20/18.
//  Copyright © 2018 Vectorform. All rights reserved.
//

import Foundation

extension NetworkManager {
    /**
     Checks if the path being used is already a full address, otherwise, prepends the baseURL

     - parameter path: String - the full path or a path relative to baseURL to create

     - Returns: an optional instance of URLComponents, if successful
     */

    internal func buildURL(path: String) -> URLComponents? {
        var finalPath: String = path
        if finalPath.hasPrefix("http") {
            // we already have a full path... use it!
            return URLComponents(string: finalPath)
        }
        finalPath = baseURL + finalPath
        return URLComponents(string: finalPath)
    }

    /**
     Builds a new URLRequest with a Body, if possible, with the given information

     - parameter method: String - one of GET, POST, PUT, etc
     - parameter path: String - a String representation of the address to query.
     - parameter parameters: JSONDictionary of key / value pairs to include in the BODY of a request.

     - Returns: a tuple with an option URLRequest if successful and an option error on failure
     */
    internal func newRequestWithBody(method: String,
                                     path: String,
                                     parameters: JSONDictionary? = nil) -> (URLRequest?, Error?) {
        if let urlComponents = buildURL(path: path) {
            guard let url = urlComponents.url else {
                return (nil, NetworkManagerError.malformedURL.error)
            }
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = method
            prepareHeaderWithRequest(request: &request)
            if let parameters: JSONDictionary = parameters {
                let bodyError: Error? = prepareBodyWithRequest(request: &request, parameters: parameters)
                guard bodyError == nil else {
                    return(nil, bodyError)
                }
            }
            return (request, nil)
        }
        return (nil, NetworkManagerError.malformedURL.error)
    }

    /**
     Builds a new URLRequest with a query string, if possible, with the given information

     - parameter method: String - one of GET, POST, PUT, etc
     - parameter path: String - a String representation of the address to query.
     - parameter parameters: JSONDictionary of key / value pairs to include in the query string

     - Returns: a tuple with an option URLRequest if successful and an option error on failure
     */
    internal func newRequest(method: String, path: String, parameters: JSONDictionary? = nil) -> (URLRequest?, Error?) {
        if var urlComponents: URLComponents = buildURL(path: path) {
            var queryItems: [URLQueryItem] = []
            if let parameters: JSONDictionary = parameters {
                for (key, value) in parameters {
                    let valueString: String = String(describing: value)
                    let item: URLQueryItem = URLQueryItem(name: key, value: valueString)
                    queryItems.append(item)
                }
            }
            urlComponents.queryItems = queryItems
            guard let url = urlComponents.url else {
                return (nil, NetworkManagerError.malformedURL.error)
            }
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = method
            prepareHeaderWithRequest(request: &request)
            return (request, nil)
        }
        return (nil, NetworkManagerError.malformedURL.error)
    }

    /**
     add accept and Content-Type header values, and if available, the Bearer token

     - parameter request: URLRequest with which to append this header info.
     */
    internal func prepareHeaderWithRequest(request: inout URLRequest) {
        if let bearerToken: String = bearerToken {
            request.addValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        }
        request.addValue("application/json", forHTTPHeaderField: "accept" )
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }

    /**
     adds JSON body to a URLRequest

     - parameter request: URLRequest with which to append this header info.
     - parameter parameters: JSONDictionary - the parameters to encode into the body of the request
     */

    internal func prepareBodyWithRequest(request: inout URLRequest, parameters: JSONDictionary) -> Error? {
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters,
                                                          options: JSONSerialization.WritingOptions.init(rawValue: 0))
        } catch {
            return NetworkManagerError.malformedJSON.error
        }
        return nil
    }
}

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation

public struct Endpoint {
  var path: String
	var queryParams: [String: String]
  
  public init(path: String, queryParams: [String: String] = ["":""]) {
    self.path = path
	self.queryParams = queryParams
  }
}

extension Endpoint {
  public var url: URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.themoviedb.org"
    components.path = "/3" + path
	var queryItems = [URLQueryItem(name: "api_key", value: Constants.TMDBEnv.apiKey)]
	queryItems.append(contentsOf: queryParams.map { URLQueryItem(name: $0.key, value: $0.value)})
	components.queryItems = queryItems
	
    guard let url = components.url else {
      preconditionFailure(
        "Invalid URL components: \(components)"
      )
    }
    return url
  }
}

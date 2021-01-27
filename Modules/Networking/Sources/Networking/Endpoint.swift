//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation

public struct Endpoint {
  var path: String
  var queryItems: [URLQueryItem] = []
  
  public init(path: String, queryItems: [URLQueryItem] = []) {
    self.path = path
    self.queryItems = queryItems
  }
}

extension Endpoint {
  public var url: URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = Constants.TMDBEnv.baseUrl
    components.path = "/" + path
    components.queryItems = queryItems.map { _ in
      URLQueryItem(name: "api_key", value: Constants.TMDBEnv.apiKey)
    }
    
    guard let url = components.url else {
      preconditionFailure(
        "Invalid URL components: \(components)"
      )
    }
    return url
  }
}

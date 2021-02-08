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
	private var apiKey: String {
		guard let filePath = Bundle.main.path(forResource: "TmdbConfig", ofType: "plist") else {
			fatalError("Couldn't find file 'TmdbConfig.plist'.")
		}
		let plist = NSDictionary(contentsOfFile: filePath)
		guard let value = plist?.object(forKey: "api_key") as? String else {
			fatalError("Couldn't find key 'api_key' in 'TmdbConfig.plist'.")
		}
		return value
	}
	
	public var url: URL {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "api.themoviedb.org"
		components.path = "/3" + path
		var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
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

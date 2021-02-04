//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation
import Combine

public struct MovieResponses: Codable {
  
  let page: Int?
}

extension URLResponse {
	func requireHTTPStatusCode(_ code: Int) throws {
		guard
			let response = self as? HTTPURLResponse,
			response.statusCode == 200
		else { throw URLError(.badServerResponse) }
	}
}

extension Publisher where Output == URLSession.DataTaskPublisher.Output {
	func justData(ifStatusCode code: Int) -> Publishers.TryMap<Self, Data> {
		return self
			.tryMap { data, response in
				try response.requireHTTPStatusCode(code)
				return data
			}
	}
}

public final class NetworkService {
  
  static private let decoder: JSONDecoder = {
    let jsonDecoder = JSONDecoder()
    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    jsonDecoder.dateDecodingStrategy = .iso8601
    return jsonDecoder
  }()
  
  static private var session: URLSession = {
     let config = URLSessionConfiguration.default
      config.urlCache = URLCache.shared
      config.waitsForConnectivity = true
      config.requestCachePolicy = .returnCacheDataElseLoad
      return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
  }()
  
  public static func request<T: Codable>(
    _ endpoint: Endpoint,
    response: T.Type) -> AnyPublisher<T, Error> {
    return session.dataTaskPublisher(for: endpoint.url)
		.tryMap { element -> Data in
			guard let httpResponse = element.response as? HTTPURLResponse,
					httpResponse.statusCode == 200 else {
				throw URLError(.badServerResponse)
			}
			return element.data
		}
      .decode(type: T.self, decoder: decoder)
      .eraseToAnyPublisher()
  }
}

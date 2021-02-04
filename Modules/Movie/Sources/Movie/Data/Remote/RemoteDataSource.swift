//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 03/02/21.
//

import Foundation
import Combine
import Networking

protocol RemoteDataSourceProtocol: AnyObject {
	
	func getMovies(path: String) -> AnyPublisher<MoviesResponses, Error>
	func getMovie(with id: String) -> AnyPublisher<MovieResponse, Error>
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesResponses, Error>
}

public final class RemoteDataSourceImpl: NSObject {
	private override init () {}
	
	public static let sharedInstance: RemoteDataSourceImpl = RemoteDataSourceImpl()
}

extension RemoteDataSourceImpl: RemoteDataSourceProtocol {
	func getMovies(path: String) -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getMovies(path: path), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
	
	func getMovie(with id: String) -> AnyPublisher<MovieResponse, Error> {
		NetworkService.request(.getMovie(id: id), response: MovieResponse.self)
			.eraseToAnyPublisher()
	}
	
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getRecommendationMovies(id: id), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
}

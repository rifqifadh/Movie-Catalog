//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import Combine
import Networking

public protocol RemoteDataSourceProtocol: AnyObject {
	
	func getNowPlayingMovies() -> AnyPublisher<MoviesResponses, Error>
	func getTopRatedMovies() -> AnyPublisher<MoviesResponses, Error>
	func getPopularMovies() -> AnyPublisher<MoviesResponses, Error>
	func getUpcomingMovies() -> AnyPublisher<MoviesResponses, Error>
	func getMovie(with id: String) -> AnyPublisher<MovieResponse, Error>
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesResponses, Error>
}

public final class RemoteDataSourceImpl: NSObject {
	private override init () {}
	
	public static let sharedInstance: RemoteDataSourceImpl = RemoteDataSourceImpl()
}

extension RemoteDataSourceImpl: RemoteDataSourceProtocol {
	public func getNowPlayingMovies() -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getNowPlayingMovies(), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
	
	public func getTopRatedMovies() -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getTopRatedMovies(), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
	
	public func getPopularMovies() -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getPopularMovies(), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
	
	public func getUpcomingMovies() -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getPopularMovies(), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
	
	public func getMovie(with id: String) -> AnyPublisher<MovieResponse, Error> {
		NetworkService.request(.getMovie(id: id), response: MovieResponse.self)
			.eraseToAnyPublisher()
	}
	
	public func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getRecommendationMovies(id: id), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
}

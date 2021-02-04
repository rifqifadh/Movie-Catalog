//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import Foundation
import Networking
import Core
import Combine

// MARK: - GetMovie
public struct GetMovieRemoteDataSource: DataSource {
	public typealias Request = String
	public typealias Response = MovieResponse
	
	public init() {}
	
	public func execute(request: String?) -> AnyPublisher<MovieResponse, Error> {
		NetworkService.request(.getMovie(id: request!), response: MovieResponse.self)
			.eraseToAnyPublisher()
	}
}

// MARK: - GetMovies
public struct GetMoviesRemoteDataSource: DataSource {
	public typealias Request = String
	public typealias Response = MoviesResponses
	
	public init() {}
	
	public func execute(request: String?) -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getMovies(path: request!), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
}

// MARK: - GetRecommendationMovies
public struct GetRecommendationMoviesRemoteDataSource: DataSource {
	public typealias Request = String
	public typealias Response = MoviesResponses
	
	public init() {}
	
	public func execute(request: String?) -> AnyPublisher<MoviesResponses, Error> {
		NetworkService.request(.getRecommendationMovies(id: request!), response: MoviesResponses.self)
			.eraseToAnyPublisher()
	}
}

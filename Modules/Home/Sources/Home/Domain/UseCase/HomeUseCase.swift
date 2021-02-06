//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import Combine
import Core

public protocol HomeUseCase {
	func getNowPlayingMovies() -> AnyPublisher<MoviesModel, Error>
	func getPopularMovies() -> AnyPublisher<MoviesModel, Error>
	func getTopRatedMovies() -> AnyPublisher<MoviesModel, Error>
	func getUpcomingMovies() -> AnyPublisher<MoviesModel, Error>
}

public class HomeInteractor: HomeUseCase {
	private let _repository: MovieRepository
	
	public required init(repository: MovieRepository) {
		_repository = repository
	}
	
	public func getNowPlayingMovies() -> AnyPublisher<MoviesModel, Error> {
		return _repository.getNowPlayingMovies()
			.eraseToAnyPublisher()
	}
	
	public func getPopularMovies() -> AnyPublisher<MoviesModel, Error> {
		return _repository.getPopularMovies()
			.eraseToAnyPublisher()
	}
	
	public func getTopRatedMovies() -> AnyPublisher<MoviesModel, Error> {
		return _repository.getTopRatedMovies()
			.eraseToAnyPublisher()
	}
	
	public func getUpcomingMovies() -> AnyPublisher<MoviesModel, Error> {
		return _repository.getUpcomingMovies()
			.eraseToAnyPublisher()
	}
}

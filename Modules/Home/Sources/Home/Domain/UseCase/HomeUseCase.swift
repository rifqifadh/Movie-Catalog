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
	}
	
	public func getPopularMovies() -> AnyPublisher<MoviesModel, Error> {
		return _repository.getPopularMovies()
	}
	
	public func getTopRatedMovies() -> AnyPublisher<MoviesModel, Error> {
		return _repository.getTopRatedMovies()
	}
	
	public func getUpcomingMovies() -> AnyPublisher<MoviesModel, Error> {
		return _repository.getUpcomingMovies()
	}
}

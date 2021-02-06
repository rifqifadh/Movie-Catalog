//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import Combine
import Core

public protocol DetailMovieUseCase {
	func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error>
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error>
}

final public class DetailMovieInteractor: DetailMovieUseCase {
	private let _repository: MovieRepository
	private let _movie: MovieModel
	
	public required init(repository: MovieRepository, movie: MovieModel) {
		_repository = repository
		_movie = movie
	}
	
	public func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error> {
		return _repository.getMovie(with: id)
			.eraseToAnyPublisher()
	}
	
	public func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error> {
		return _repository.getRecommendationMovies(with: id)
			.eraseToAnyPublisher()
	}
}

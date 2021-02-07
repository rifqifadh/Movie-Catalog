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
	// MARK: - Remote
	func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error>
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error>
	func getCredits(with id: String) -> AnyPublisher<CreditsModel, Error>
	
	// MARK: - Locale
	func addToFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error>
	func deleteFromFavorite(id: String) -> AnyPublisher<Bool, Error>
	func isFavorite(id: String) -> AnyPublisher<Bool, Never>
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
	
	public func getCredits(with id: String) -> AnyPublisher<CreditsModel, Error> {
		return _repository.getCredits(with: id)
			.eraseToAnyPublisher()
	}
	
	public func addToFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error> {
		return _repository.addToFavorite(movie: movie)
			.eraseToAnyPublisher()
	}
	
	public func deleteFromFavorite(id: String) -> AnyPublisher<Bool, Error> {
		return _repository.deleteFromFavorite(with: id)
			.eraseToAnyPublisher()
	}
	
	public func isFavorite(id: String) -> AnyPublisher<Bool, Never> {
		return _repository.isFavorite(id: id)
			.eraseToAnyPublisher()
	}
}

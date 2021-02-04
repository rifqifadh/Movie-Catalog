//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 04/02/21.
//

import Foundation
import Combine

public protocol DetailMovieUseCase {
	func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error>
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error>
	func addToFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error>
	func deleteFromFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error>
	func isFavorite(with id: String) -> AnyPublisher<Bool, Error>
}

public class DetailMovieInteractor: DetailMovieUseCase {
	
	private let _repository: MovieRepository
	private let _movie: MovieModel
	
	public required init(
		repository: MovieRepository,
		movie: MovieModel) {
		_repository = repository
		_movie = movie
	}
	
	public func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error> {
		return _repository.getMovie(with: id)
	}
	
	public func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error> {
		return _repository.getRecommendationMovies(with: id)
	}
	
	public func addToFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error> {
		return _repository.addToFavorite(movie: movie)
	}
	
	public func deleteFromFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error> {
		return _repository.deleteFromFavorite(movie: movie)
	}
	
	public func isFavorite(with id: String) -> AnyPublisher<Bool, Error> {
		return _repository.isFavorite(with: id)
	}
}

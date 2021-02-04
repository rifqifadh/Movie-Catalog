//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 04/02/21.
//

import Foundation
import Combine
import Networking

public protocol MovieRepositoryProtocol {
	// MARK: - Remote
	func getMovies(path: String) -> AnyPublisher<MoviesModel, Error>
	func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error>
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error>
	
	// MARK: - Locale
	func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
	func addToFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error>
	func deleteFromFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error>
	func isFavorite(with id: String) -> AnyPublisher<Bool, Error>
}

public final class MovieRepository: NSObject {
	
	public typealias MovieInstance = (RemoteDataSourceImpl, LocaleDataSourceImpl) -> MovieRepository
	
	fileprivate let _remote: RemoteDataSourceImpl
	fileprivate let _locale: LocaleDataSourceImpl
	
	private init(remote: RemoteDataSourceImpl, locale: LocaleDataSourceImpl) {
		_remote = remote
		_locale = locale
	}
	
	public static let sharedInstance: MovieInstance = { remoteRepo, localeRepo in
		return MovieRepository(remote: remoteRepo, locale: localeRepo)
	}
}

extension MovieRepository: MovieRepositoryProtocol {
	
	public func getMovies(path: String) -> AnyPublisher<MoviesModel, Error> {
		return _remote.getMovies(path: path)
			.map { MoviesMapper.transformResponseToDomain(response: $0) }
			.eraseToAnyPublisher()
	}
	
	public func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error> {
		return _remote.getMovie(with: id)
			.map { DetailMovieMapper.transformResponseToDomain(response: $0)}
			.eraseToAnyPublisher()
	}
	
	public func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error> {
		return _remote.getRecommendationMovies(with: id)
			.map { MoviesMapper.transformResponseToDomain(response: $0)}
			.eraseToAnyPublisher()
	}
	
	public func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
		return _locale.getFavoriteMovies()
			.map { entities in
				MoviesMapper.transformEntityToDomain(entity: entities)
			}
			.eraseToAnyPublisher()
	}
	
	public func addToFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error> {
		return _locale.addToFavorite(movie: MovieMapper
												.transformDomainToEntity(domain: movie))
			.eraseToAnyPublisher()
	}
	
	public func deleteFromFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error> {
		return _locale.deleteFromFavorite(movie: MovieMapper
														.transformDomainToEntity(domain: movie))
			.eraseToAnyPublisher()
	}
	
	public func isFavorite(with id: String) -> AnyPublisher<Bool, Error> {
		return _locale.isFavorite(with: id)
			.eraseToAnyPublisher()
	}
	
	
}

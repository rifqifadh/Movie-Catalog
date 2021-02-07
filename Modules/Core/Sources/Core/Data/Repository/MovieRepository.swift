//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import Combine

public protocol MovieRepositoryProtocol {
	// MARK: - Remote
	func getNowPlayingMovies() -> AnyPublisher<MoviesModel, Error>
	func getPopularMovies() -> AnyPublisher<MoviesModel, Error>
	func getTopRatedMovies() -> AnyPublisher<MoviesModel, Error>
	func getUpcomingMovies() -> AnyPublisher<MoviesModel, Error>
	func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error>
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error>
	func getCredits(with id: String) -> AnyPublisher<CreditsModel, Error>
	
	// MARK: - Locale
	func addToFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error>
	func deleteFromFavorite(with id: String) -> AnyPublisher<Bool, Error>
	func isFavorite(id: String) -> AnyPublisher<Bool, Never>
	func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
}

public final class MovieRepository: NSObject {
	
	public typealias HomeInstance = (RemoteDataSourceImpl, LocaleDataSourceImpl) -> MovieRepository
	
	fileprivate let _remote: RemoteDataSourceImpl
	fileprivate let _locale: LocaleDataSourceImpl
	
	private init(remote: RemoteDataSourceImpl, locale: LocaleDataSourceImpl) {
		_remote = remote
		_locale = locale
	}
	
	public static let sharedInstance: HomeInstance = { remote, locale in
		return MovieRepository(remote: remote, locale: locale)
	}
}

extension MovieRepository: MovieRepositoryProtocol {
	
	// MARK: - Remote
	public func getNowPlayingMovies() -> AnyPublisher<MoviesModel, Error> {
		return _remote.getNowPlayingMovies()
			.map { MoviesMapper.transformResponseToDomain(response: $0)}
			.eraseToAnyPublisher()
	}
	
	public func getPopularMovies() -> AnyPublisher<MoviesModel, Error> {
		return _remote.getPopularMovies()
			.map { MoviesMapper.transformResponseToDomain(response: $0)}
			.eraseToAnyPublisher()
	}
	
	public func getTopRatedMovies() -> AnyPublisher<MoviesModel, Error> {
		return _remote.getTopRatedMovies()
			.map { MoviesMapper.transformResponseToDomain(response: $0)}
			.eraseToAnyPublisher()
	}
	
	public func getUpcomingMovies() -> AnyPublisher<MoviesModel, Error> {
		return _remote.getUpcomingMovies()
			.map { MoviesMapper.transformResponseToDomain(response: $0)}
			.eraseToAnyPublisher()
	}
	
	public func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error> {
		return _remote.getMovie(with: id)
			.map { DetailMovieMapper.transformResponseToDomain(response: $0) }
			.eraseToAnyPublisher()
	}
	
	public func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error> {
		return _remote.getRecommendationMovies(with: id)
			.map { MoviesMapper.transformResponseToDomain(response: $0) }
			.eraseToAnyPublisher()
	}
	
	public func getCredits(with id: String) -> AnyPublisher<CreditsModel, Error> {
		return _remote.getCredits(with: id)
			.map { CreditsMapper.transformResponseToDomain(response: $0) }
			.eraseToAnyPublisher()
	}
	
	// MARK: - Locale
	public func addToFavorite(movie: MovieModel) -> AnyPublisher<Bool, Error> {
		return _locale.addToFavorite(entity: MovieMapper.transformDomainToEntity(domain: movie))
			.eraseToAnyPublisher()
	}
	
	public func deleteFromFavorite(with id: String) -> AnyPublisher<Bool, Error> {
		return _locale.deleteFromFavorite(with: id)
			.eraseToAnyPublisher()
	}
	
	public func isFavorite(id: String) -> AnyPublisher<Bool, Never> {
		return _locale.isFavorite(with: id)
			.eraseToAnyPublisher()
	}
	
	public func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
		return _locale.getFavoriteMovies()
			.map { MovieMapper.transformEntityToDomain(entity: $0) }
			.eraseToAnyPublisher()
	}
}

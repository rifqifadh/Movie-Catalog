//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import Combine

public protocol MovieRepositoryProtocol {
	func getNowPlayingMovies() -> AnyPublisher<MoviesModel, Error>
	func getPopularMovies() -> AnyPublisher<MoviesModel, Error>
	func getTopRatedMovies() -> AnyPublisher<MoviesModel, Error>
	func getUpcomingMovies() -> AnyPublisher<MoviesModel, Error>
	func getMovie(with id: String) -> AnyPublisher<DetailMovieModel, Error>
	func getRecommendationMovies(with id: String) -> AnyPublisher<MoviesModel, Error>
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
}
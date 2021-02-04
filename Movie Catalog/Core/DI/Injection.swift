//
//  DI.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 30/01/21.
//

import Foundation
import Movie
import Core
import Realm
import RealmSwift

class Injection: NSObject {
	
	let realm = try? Realm()
	
	func provideMovies<U: UseCase>() -> U where U.Request == String, U.Response == MoviesModel {
		
		let remote = GetMoviesRemoteDataSource()
		let mapper = MoviesTransformer()
		
		let repository = GetMoviesRepository(remoteDataSource: remote, mapper: mapper)
		
		return Interactor(repository: repository) as! U
	}
	
	func provideDetailMovie(movie: MovieModel) -> DetailMovieUseCase {
		let remote: RemoteDataSourceImpl = RemoteDataSourceImpl.sharedInstance
		let locale: LocaleDataSourceImpl = LocaleDataSourceImpl.sharedInstance(realm)
		
		let repository = MovieRepository.sharedInstance(remote, locale)
		
		return DetailMovieInteractor(repository: repository, movie: movie)
	}
}

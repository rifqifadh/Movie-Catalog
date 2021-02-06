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
import Home

class Injection: NSObject {
	
	let realm = try? Realm()
	
	func provideHome() -> HomeUseCase {
		
		let remote: Core.RemoteDataSourceImpl = RemoteDataSourceImpl.sharedInstance
		let locale: Core.LocaleDataSourceImpl = LocaleDataSourceImpl.sharedInstance(realm)
		
		let repository = MovieRepository.sharedInstance(remote, locale)
		
		return HomeInteractor(repository: repository)
	}
	
//	func provideDetailMovie(movie: Core.MovieModel) -> DetailMovieUseCase {
//		let remote: Movie.RemoteDataSourceImpl = RemoteDataSourceImpl.sharedInstance
//		let locale: Movie.LocaleDataSourceImpl = LocaleDataSourceImpl.sharedInstance(realm)
//		
//		let repository = MovieRepository.sharedInstance(remote, locale)
//		
//		return DetailMovieInteractor(repository: repository, movie: movie)
//	}
}

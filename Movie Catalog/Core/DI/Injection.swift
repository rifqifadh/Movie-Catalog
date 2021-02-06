//
//  DI.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 30/01/21.
//

import Foundation
import Core
import Realm
import RealmSwift
import Home
import DetailMovie

class Injection: NSObject {
	
	let realm = try? Realm()
	
	func provideHome() -> HomeUseCase {
		
		let remote: RemoteDataSourceImpl = RemoteDataSourceImpl.sharedInstance
		let locale: LocaleDataSourceImpl = LocaleDataSourceImpl.sharedInstance(realm)
		
		let repository = MovieRepository.sharedInstance(remote, locale)
		
		return HomeInteractor(repository: repository)
	}
	
	func provideDetailMovie(movie: MovieModel) -> DetailMovieUseCase {
		let remote: RemoteDataSourceImpl = RemoteDataSourceImpl.sharedInstance
		let locale: LocaleDataSourceImpl = LocaleDataSourceImpl.sharedInstance(realm)
		
		let repository = MovieRepository.sharedInstance(remote, locale)
		
		return DetailMovieInteractor(repository: repository, movie: movie)
	}
}

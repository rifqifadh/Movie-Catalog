//
//  DI.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 30/01/21.
//

import Foundation
import Core
import RealmSwift
import Home
import DetailMovie

class Injection: NSObject {
	
	func provideRepository() -> MovieRepository {
		let realm = try? Realm()
		let remote: RemoteDataSourceImpl = RemoteDataSourceImpl.sharedInstance
		let locale: LocaleDataSourceImpl = LocaleDataSourceImpl.sharedInstance(realm)
		
		return MovieRepository.sharedInstance(remote, locale)
	}
	
	func provideHome() -> HomeUseCase {
		let repository = provideRepository()
		
		return HomeInteractor(repository: repository)
	}
	
	func provideDetailMovie(movie: MovieModel) -> DetailMovieUseCase {
		let repository = provideRepository()
		
		return DetailMovieInteractor(repository: repository, movie: movie)
	}
}

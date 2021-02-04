//
//  HomeRouter.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import SwiftUI
import Core
import Movie

class HomeRouter {
	
	func makeDetailView(for movie: MovieModel) -> some View {
		let useCase = Injection.init().provideDetailMovie(movie: movie)
		let presenter = DetailMoviePresenter(useCase: useCase, movie: movie)
		
		return DetailMovieView(presenter: presenter, movie: movie)
	}
}

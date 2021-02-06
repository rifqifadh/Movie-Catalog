//
//  FavoriteRouter.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import SwiftUI
import Core
import DetailMovie

class FavoriteRouter {
	
	func makeDetailView(for movie: MovieModel) -> some View {
		let useCase = Injection.init().provideDetailMovie(movie: movie)
		let viewModel = DetailMovieViewModel(useCase: useCase, movie: movie)
		
		return DetailMovieView(viewModel: viewModel, movie: movie)
	}
}

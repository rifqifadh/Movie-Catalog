//
//  DetailMovieRouter.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 02/02/21.
//

import Foundation
import SwiftUI
import Core
import DetailMovie

class DetailMovieRouter {
	func makeDetailView(for movie: Core.MovieModel) -> some View {
		let useCase = Injection.init().provideDetailMovie(movie: movie)
		let viewModel = DetailMovieViewModel(useCase: useCase, movie: movie)
		
		return DetailMovieView(viewModel: viewModel, movie: movie)
	}
}

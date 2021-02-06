//
//  DetailMovieView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import SwiftUI
import SharedUI
import Core
import SDWebImageSwiftUI
import DetailMovie

struct DetailMovieView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@StateObject var viewModel: DetailMovieViewModel
	@State private var toggle = false
	
	var movie: Core.MovieModel
	
	var body: some View {
		ZStack {
			VStack {
				StickyHeader(heightHeader: 290) {
					WebImage(url: viewModel.movie?.backdropUrl)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.clipShape(RoundedRectangle(cornerRadius: 25.0))
				} content: {
					VStack {
						ContentDetailMovieView(movie: viewModel.movie, viewModel: viewModel)
							.redacted(reason: viewModel.isLoadingDetail ? .placeholder : [])
						
						RecommendationMoviesRow(
							items: viewModel.recommendationMovies,
							destination: { movie in
								DetailMovieRouter().makeDetailView(for: movie)
							})
						.redacted(reason: viewModel.isLoadingMovies ? .placeholder : [])
					}
					.cornerRadius(20)
					.offset(x: 0, y: -32)
					.background(Color.white.edgesIgnoringSafeArea(.all))
				} dismiss: {
					self.presentationMode.wrappedValue.dismiss()
				}
				.onAppear {
					viewModel.getMovie(with: movie.id)
					viewModel.getRecommendationMovies(id: movie.id)
				}
				.navigationBarHidden(true)
			}
		}
	}
}

//
//  DetailMovieView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import SwiftUI
import MovieCatalogUI
import Core
import SDWebImageSwiftUI
import DetailMovie

struct DetailMovieView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@StateObject var viewModel: DetailMovieViewModel
	@State private var toggle = false
	
	var movie: MovieModel
	
	// MARK: - blurView
	
	var blurView: some View {
		VisualEffectBlur(blurStyle: .systemUltraThinMaterial) {
			VStack(alignment: .center) {
				Image(systemName: "checkmark")
					.resizable()
					.frame(width: 100, height: 100)
				
				Spacer()
				
				Text("Added to Favorite")
					.font(.title3)
					.fontWeight(.semibold)
			}
			.foregroundColor(Color.secondary)
			.padding()
		}
		.cornerRadius(16)
		.frame(width: 200, height: 200, alignment: .center)
	}
	
	// MARK: - body
	
	var body: some View {
		ZStack(alignment: .center) {
			VStack(spacing: 0) {
				StickyHeader(heightHeader: 290) {
					WebImage(url: viewModel.movie?.backdropUrl)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.clipShape(RoundedRectangle(cornerRadius: 25.0))
				} content: {
					VStack(alignment: .leading, spacing: 0) {
						
						ContentDetailMovieView(movie: viewModel.movie, viewModel: viewModel)
							.redacted(reason: viewModel.isLoadingDetail ? .placeholder : [])
						
						CastsRowView(casts: viewModel.castMovie)
							.redacted(reason: viewModel.isLoadingCredits ? .placeholder : [])
						
						RecommendationMoviesRow(
							items: viewModel.recommendationMovies,
							destination: { movie in
								DetailMovieRouter().makeDetailView(for: movie)
							})
							.redacted(reason: viewModel.isLoadingMovies ? .placeholder : [])
							.padding(.bottom)
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
					viewModel.getCredits(id: movie.id)
					viewModel.isFavoriteMovie()
				}
				.navigationBarHidden(true)
			}
			
			if viewModel.successAddToFav {
				blurView
			}
		}
		.actionSheet(isPresented: $viewModel.alertConfirmDelete, content: {
			ActionSheet(title: Text("Apakah anda yakin ingin menghapus \(movie.title) dari daftar Favorite ?"),
							buttons: [
								.default(Text("Delete")) { viewModel.deleteFromFavorite() },
								.cancel()])
		})
	}
}

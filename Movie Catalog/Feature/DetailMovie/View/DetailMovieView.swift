////
////  DetailMovieView.swift
////  Movie Catalog
////
////  Created by Rifqi Fadhlillah on 01/02/21.
////
//
//import SwiftUI
//import SharedUI
//import Movie
//import Core
//import SDWebImageSwiftUI
//
//struct DetailMovieView: View {
//	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//	@StateObject var presenter: DetailMoviePresenter
//	@State private var toggle = false
//	
//	var movie: Core.MovieModel
//	
//	var body: some View {
//		ZStack {
//			VStack {
//				StickyHeader(heightHeader: 290) {
//					WebImage(url: presenter.movie?.backdropUrl)
//						.resizable()
//						.aspectRatio(contentMode: .fill)
//						.clipShape(RoundedRectangle(cornerRadius: 25.0))
//				} content: {
//					VStack {
//						ContentDetailMovieView(movie: presenter.movie, presenter: presenter)
//							.redacted(reason: presenter.isLoadingDetail ? .placeholder : [])
//						
//						MoviesRowView(items: presenter.recommendationMovies) {
//							Text("Recommendation Movies")
//								.font(.headline)
//								.fontWeight(.semibold)
//								.padding(.horizontal)
//								.padding(.top)
//						} destination: { movie in
//							DetailMovieRouter().makeDetailView(for: movie)
//						}
//						.accentColor(.black)
//						.redacted(reason: presenter.isLoadingMovies ? .placeholder : [])
//					}
//					.cornerRadius(20)
//					.offset(x: 0, y: -32)
//					.background(Color.white.edgesIgnoringSafeArea(.all))
//				} dismiss: {
//					self.presentationMode.wrappedValue.dismiss()
//				}
//				.onAppear {
//					presenter.getMovie(id: movie.id)
//					presenter.getRecommendationMovies(id: movie.id)
//				}
//				.navigationBarHidden(true)
//			}
//		}
//	}
//}

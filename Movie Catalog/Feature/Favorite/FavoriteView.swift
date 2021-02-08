//
//  FavoriteView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 29/01/21.
//

import SwiftUI
import Favorite
import TheMovieDBSDK

struct FavoriteView: View {
	@StateObject var viewModel = FavoritePresenter(useCase: Injection().provideFavorite())
	@State var firstAppear: Bool = true
	
	// MARK: - Empty Favorite
	
	var emptyFavorite: some View {
		VStack {
			Image("empty-illustration")
				.resizable()
				.frame(width: 180, height: 180)
			Text("Favorite Movie Empty")
				.font(.title3)
				.fontWeight(.bold)
				.multilineTextAlignment(.center)
			Text("You can Add Movie to Favorite in Detail Movie")
				.font(.caption)
				.foregroundColor(.secondary)
				.multilineTextAlignment(.center)
		}
	}
	
	// MARK: - body
	
	var body: some View {
		NavigationView {
			ZStack(alignment: .center) {
				if viewModel.movies.isEmpty {
					emptyFavorite
				} else {
					List {
						ForEach(viewModel.movies) { movie in
							ZStack {
								linkBuilder(for: movie) {
									CardFavoriteView(movie: movie)
								}
								.buttonStyle(PlainButtonStyle())
							}
						}
					}
					.listStyle(PlainListStyle())
				}
			}
			.onAppear {
				viewModel.getFavoriteMovies()
			}
			.navigationTitle("Favorite")
		}
	}
}

extension FavoriteView {
	func linkBuilder<Content: View>(for movie: MovieModel, @ViewBuilder content: () -> Content) -> some View {
		NavigationLink(
			destination: FavoriteRouter().makeDetailView(for: movie)) {
			content()
		}
	}
}

struct FavoriteView_Previews: PreviewProvider {
	static var previews: some View {
		FavoriteView()
	}
}

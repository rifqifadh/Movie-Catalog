//
//  SwiftUIView.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import MovieCatalogUI
import TheMovieDBSDK
import SDWebImageSwiftUI
import SwiftUI
import Core

public struct RecommendationMoviesRow<Destination: View>: View {
	
	var items: [MovieModel] = [MovieModel.default]
	var destination: (_ movie: MovieModel) -> Destination
	
	public init(
		items: [MovieModel],
		@ViewBuilder destination: @escaping (_ movie: MovieModel) -> Destination) {
		self.items = items
		self.destination = destination
	}
	
	public var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("Recommendation Movies")
				.font(.headline)
				.fontWeight(.semibold)
				.padding()
			
			ScrollView(.horizontal, showsIndicators: false) {
				LazyHStack(alignment: .top, spacing: 12) {
					ForEach(items) { movie in
						ZStack {
							linkBuilder(for: movie) {
								MovieCardView(poster: movie.poster,
												  progressValue: (movie.voteAverage * 10),
												  title: movie.title,
												  ratingColor: movie.ratingProgressColor,
												  width: 110)
							}
							.buttonStyle(PlainButtonStyle())
						}
					}
				}
				.padding(.horizontal)
			}
			.frame(height: 230)
		}
	}
}

// MARK: Link Builder
public extension RecommendationMoviesRow {
	func linkBuilder<Content: View>(for movie: MovieModel, @ViewBuilder content: () -> Content) -> some View {
		NavigationLink(
			destination: destination(movie)) {
			content()
		}
	}
}

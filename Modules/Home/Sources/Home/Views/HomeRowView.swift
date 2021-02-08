//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import MovieCatalogUI
import TheMovieDBSDK
import SDWebImageSwiftUI
import SwiftUI

public struct HomeRowView<Header: View, Destination: View>: View {
	
	var items: [MovieModel] = [MovieModel.default]
	var header: () -> Header
	var destination: (_ movie: MovieModel) -> Destination
	
	public init(
		items: [MovieModel],
		@ViewBuilder header: @escaping () -> Header,
		@ViewBuilder destination: @escaping (_ movie: MovieModel) -> Destination) {
		self.items = items
		self.header = header
		self.destination = destination
	}
	
	public var body: some View {
		VStack(alignment: .leading) {
			header()
			ScrollView(.horizontal, showsIndicators: false) {
				LazyHStack(alignment: .top, spacing: 12) {
					ForEach(items) { movie in
						ZStack {
							linkBuilder(for: movie) {
								MovieCardView(poster: movie.poster,
												  progressValue: (movie.voteAverage * 10),
												  title: movie.title,
												  ratingColor: movie.ratingProgressColor)
							}
							.buttonStyle(PlainButtonStyle())
						}
					}
				}
				.padding(.horizontal)
			}
		}
	}
}

// MARK: Link Builder
public extension HomeRowView {
	func linkBuilder<Content: View>(for movie: MovieModel, @ViewBuilder content: () -> Content) -> some View {
		NavigationLink(
			destination: destination(movie)) {
			content()
		}
	}
}

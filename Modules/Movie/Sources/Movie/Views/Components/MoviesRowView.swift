//
//  SwiftUIView.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/02/21.
//

import SwiftUI

public struct MoviesRowView<Header: View, Destination: View>: View {
	
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
								MovieCardView(item: movie, width: 100)
									.buttonStyle(PlainButtonStyle())
							}
						}
					}
				}
				.padding(.horizontal)
			}
		}
	}
}

// MARK: Link Builder
public extension MoviesRowView {
	func linkBuilder<Content: View>(for movie: MovieModel, @ViewBuilder content: () -> Content) -> some View {
		NavigationLink(
			destination: destination(movie)) {
			content()
		}
	}
}

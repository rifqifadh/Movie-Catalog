//
//  HomeView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 29/01/21.
//

import SwiftUI
import Core
import Home
import SharedUI

struct MoviesView: View {
	@StateObject var viewModel = HomeViewModel(useCase: Injection().provideHome())
	@State var firstAppear: Bool = true
	
	var body: some View {
		return NavigationView {
			List {
				ForEach(viewModel.homeSection.sorted(by: { $0.0 < $1.0 }), id: \.key) { key, value in
					HomeRowView(items: value) {
						Text(key.rawValue)
							.font(.title3)
							.fontWeight(.medium)
							.padding(.leading, 15)
							.padding(.top, 16)
					} destination: { movie in
						Text("title \(movie.title)")
					}

			  }
			  .listRowInsets(EdgeInsets())
			}
			.onAppear {
				if !firstAppear { return }
				viewModel.getMoviesSection()
				firstAppear = false
			}
			.navigationTitle("Movies")
	  }
	}
}

struct CapsuleTabButton: View {
	
	var title: String
	@Binding var selectedTab: String
	
	var body: some View {
		Button {
			selectedTab = title
		} label: {
			Text("\(title)")
				.fontWeight(.medium)
				.font(.caption)
				.foregroundColor(foregroundColor())
				.padding(.horizontal)
				.padding(.vertical, 8)
				.background(Capsule().fill(backgroundColor()))
				.overlay(
					Capsule()
						.stroke(borderColor(), lineWidth: 3)
				)
		}
		.padding(.vertical, 3)
	}
	
	func backgroundColor() -> Color {
		return selectedTab == title ? Color.accentColor : Color.white
	}
	
	func foregroundColor() -> Color {
		return selectedTab == title ? Color.white : Color.accentColor
	}
	
	func borderColor() -> Color {
		return selectedTab == title ? Color.accentColor : Color.accentColor
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

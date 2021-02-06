//
//  HomeView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 29/01/21.
//

import SwiftUI
import Core
import Home
import MovieCatalogUI

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
						HomeRouter().makeDetailView(for: movie)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

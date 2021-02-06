//
//  RootView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 29/01/21.
//

import SwiftUI

struct RootTabView: View {
	@State var selectedView = 0
	
    var body: some View {
		TabView(selection: $selectedView) {
			MoviesView()
			 .tabItem {
				Image(systemName: "film.fill")
				Text("Movies")
			 }
			 .tag(0)
		  
			FavoriteView()
			 .tabItem {
				Image(systemName: "heart.fill")
				Text("Favorite")
			 }
			 .tag(1)
		  
		  AccountView()
			 .tabItem {
				Image(systemName: "person.fill")
				Text("Account")
			 }
			 .tag(2)
		}
		.accentColor(Color("AccentColor"))
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}

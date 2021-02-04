//
//  AccountView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 29/01/21.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
		NavigationView {
		  VStack {
			 HStack {
				Image("Profile")
				  .resizable()
				  .clipShape(Circle())
				  .aspectRatio(contentMode: .fill)
				  .frame(width: 100, height: 100, alignment: .center)
			 }
			 Form {
				Section(header:
							 Text("Biodata")
							 .font(.body)
							 .fontWeight(.bold)) {
				  Text("Rifqi Fadhlillah")
				  Text("rifqifadh0605@gmail.com")
				  HStack {
					 Text("+62")
					 Text("82124319146")
				  }
				  Text("linkedin.com/rifqi-fadh")
				  Text("github.com/rifqifadh")
				}
			 }
			 .navigationBarTitle("Account")
			.navigationBarTitleDisplayMode(.inline)
		  }
		}
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

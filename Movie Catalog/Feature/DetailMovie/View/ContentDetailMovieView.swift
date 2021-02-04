//
//  ContentDetailMovieView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 02/02/21.
//

import SwiftUI
import Movie
import SharedUI
import SDWebImageSwiftUI

struct ContentDetailMovieView: View {
	var movie: DetailMovieModel?
	@State var toggle = true
	@ObservedObject var presenter: DetailMoviePresenter
	
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			HStack(alignment: .top) {
				WebImage(url: movie?.posterUrl)
					  .resizable()
					  .frame(width: 80, height: 110)
					  .scaledToFill()
						.cornerRadius(16)
				VStack(alignment: .leading, spacing: 3) {
					Group {
						Text(movie?.title ?? "")
							.font(.headline)
							.fontWeight(.semibold)
							.lineLimit(2)
							.fixedSize(horizontal: false, vertical: true)
						
						HStack {
							Text("\(movie?.releaseDateFormatted ?? "-")")
								.font(.caption)
								.foregroundColor(.secondary)
								.fontWeight(.semibold)
							
							Circle()
								.foregroundColor(.secondary)
								.frame(width: 4, height: 4)
							
							Text("\(movie?.runtime.minutesToHoursMinute() ?? "-")")
								.font(.caption)
								.foregroundColor(.secondary)
								.fontWeight(.semibold)
						}
						
						Text("\(movie?.genresName ?? [""], empty: "-")")
							.font(.caption)
							.foregroundColor(.secondary)
							.fontWeight(.semibold)
							.lineLimit(2)
							.fixedSize(horizontal: false, vertical: true)
						
						RatingStarView(rating: .constant(4))
							.font(.caption)
					}
				}
				Spacer()
				favoriteButton()
			}
			Text("Tagline")
				.font(.headline)
				.fontWeight(.semibold)
			
			Text(movie?.tagline ?? "-")
				.font(.caption)
				.foregroundColor(.secondary)
				.fontWeight(.semibold)
			
			Text("Overview")
				.font(.headline)
				.fontWeight(.semibold)
			
			Text(movie?.overview ?? "")
				.font(.caption)
				.foregroundColor(.secondary)
				.multilineTextAlignment(.leading)
				.fixedSize(horizontal: false, vertical: true)
		}
		.padding(.top, 12)
		.padding(.horizontal)
		.frame(minWidth: 0, maxWidth: .infinity)
		.background(Color.white)
	}
	
	private func favoriteButton() -> some View {
		Button {
			withAnimation(.easeInOut) {
				toggle.toggle()
				presenter.addToFavorite()
			}
		} label: {
			ZStack(alignment: .center) {
				Circle()
					.fill(Color.accentColor)
				HStack {
					Image(systemName: toggle ? "heart.fill" : "heart.slash.fill")
						.foregroundColor(.white)
				}
				.padding(.horizontal, 5)
			}
			.unredacted()
			.frame(width: 40, height: 40)
		}
	}
}

//struct ContentDetailMovieView_Preview: PreviewProvider {
//
//	static var previews: some View {
//		ContentDetailMovieView(movie: DetailMovieModel.default, toggle: false, presenter: <#DetailMoviePresenter#>)
//	}
//}

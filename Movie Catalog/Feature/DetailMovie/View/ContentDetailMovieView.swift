//
//  ContentDetailMovieView.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 02/02/21.
//

import SwiftUI
import SharedUI
import SDWebImageSwiftUI
import DetailMovie
import Core

struct ContentDetailMovieView: View {
	var movie: DetailMovieModel?
	@ObservedObject var viewModel: DetailMovieViewModel

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
			viewModel.actionFavoriteButton()
		} label: {
			ZStack(alignment: .center) {
				Circle()
					.fill(Color("AccentColor"))
				HStack {
					Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart.slash.fill")
						.foregroundColor(.white)
				}
				.padding(.horizontal, 5)
			}
			.unredacted()
			.frame(width: 40, height: 40)
			.buttonStyle(PlainButtonStyle())
		}
	}
}

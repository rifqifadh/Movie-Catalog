//
//  SwiftUIView.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import SwiftUI
import TheMovieDBSDK
import SDWebImageSwiftUI
import MovieCatalogUI

public struct CardFavoriteView: View {
	
	var movie: MovieModel
	
	public init (movie: MovieModel) {
		self.movie = movie
	}
	
	public var body: some View {
		HStack(alignment: .top) {
			WebImage(url: URL(string: movie.poster))
				.resizable()
				.cornerRadius(8)
				.frame(width: 90, height: 130)
			
			VStack(alignment: .leading, spacing: 6) {
				Text(movie.title)
					.font(.subheadline)
					.fontWeight(.semibold)
					.foregroundColor(.primary)
					.lineLimit(3)
					.fixedSize(horizontal: false, vertical: true)
				
				HStack(alignment: .center) {
					ProgressView(value: (movie.voteAverage * 10), total: 100)
						.progressViewStyle(
							CirclePercentageProgressViewStyle(
								strokeWidth: 8,
								fontType: .system(size: 10),
								fontColor: Color.white,
								primaryColor: movie.ratingProgressColor,
								secondaryColor: .gray)
						)
						.frame(width: 35, height: 35, alignment: .center)
					
					Text(movie.releaseDateFormatted)
						.font(.caption)
						.fontWeight(.medium)
						.foregroundColor(.primary)
				}
				
				Text(movie.overview)
					.font(.caption2)
					.foregroundColor(.secondary)
					.lineLimit(3)
					.fixedSize(horizontal: false, vertical: true)
					.padding(.top, 6)
			}
			.padding(.leading)
		}
	}
}

struct CardFavoriteView_Previews: PreviewProvider {
	static var previews: some View {
		CardFavoriteView(movie: MovieModel.default2)
			.previewLayout(.fixed(width: 520, height: 220))
		
	}
}

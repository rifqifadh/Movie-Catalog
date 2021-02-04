//
//  MovieCard.swift
//  Movie DB
//
//  Created by Rifqi Fadhlillah on 03/11/20.
//

import SwiftUI
import SharedUI
import SDWebImageSwiftUI

public struct MovieCardView: View {
	var item: MovieModel
	var width: CGFloat
	
	public init(
		item: MovieModel,
		width: CGFloat = 120) {
		self.item = item
		self.width = width
	}
	
	public var body: some View {
		VStack(alignment: .center) {
			ZStack(alignment: .bottomLeading) {
				WebImage(url: URL(string: item.poster ))
					.renderingMode(.original)
					.resizable()
					.indicator(.activity)
					.cornerRadius(10)
					.frame(width: width, height: width * 1.4)
				
				ProgressView(value: item.rating, total: 100)
					.progressViewStyle(
						CirclePercentageProgressViewStyle(
							strokeWidth: 6,
							fontType: .system(size: 8),
							fontColor: Color.white,
							primaryColor: item.ratingProgressColor,
							secondaryColor: .gray)
					)
					.frame(width: 30, height: 30, alignment: .center)
					.padding(.leading, 5)
					.offset(y: 15)
				
			}.frame(height: width * 1.5)
			
			Text(item.title)
				.font(width > 110 ? .caption : .caption2)
				.fontWeight(.medium)
				.multilineTextAlignment(.center)
				.lineLimit(2)
				.padding(.top, 8)
			
			Spacer()
		}
		.frame(width: width, height: width * 2)
	}
}

struct MovieCard_Previews: PreviewProvider {
	static var previews: some View {
		MovieCardView(item: MovieModel.default)
	}
}

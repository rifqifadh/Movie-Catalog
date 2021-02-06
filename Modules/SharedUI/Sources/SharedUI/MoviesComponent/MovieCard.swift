//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

public struct MovieCardView: View {
	var _poster: String
	var _progressValue: Double
	var _title: String
	var _ratingColor: Color
	var _width: CGFloat = 120
	
	public init(
		poster: String,
		progressValue: Double,
		title: String,
		ratingColor: Color,
		width: CGFloat = 120) {
		_poster = poster
		_progressValue = progressValue
		_title = title
		_ratingColor = ratingColor
		_width = width
	}
	
	public var body: some View {
		VStack(alignment: .center) {
			ZStack(alignment: .bottomLeading) {
				WebImage(url: URL(string: _poster ))
					.renderingMode(.original)
					.resizable()
					.indicator(.activity)
					.cornerRadius(10)
					.frame(width: _width, height: _width * 1.4)
				
				ProgressView(value: _progressValue, total: 100)
					.progressViewStyle(
						CirclePercentageProgressViewStyle(
							strokeWidth: 6,
							fontType: .system(size: 8),
							fontColor: Color.white,
							primaryColor: _ratingColor,
							secondaryColor: .gray)
					)
					.frame(width: 30, height: 30, alignment: .center)
					.padding(.leading, 5)
					.offset(y: 15)
				
			}.frame(height: _width * 1.5)
			
			Text(_title)
				.font(_width > 110 ? .caption : .caption2)
				.fontWeight(.medium)
				.multilineTextAlignment(.center)
				.lineLimit(2)
				.padding(.top, 8)
			
			Spacer()
		}
		.frame(width: _width, height: _width * 2)
	}
}

//
//  CircleProgressViewStyle.swift
//  Movie DB
//
//  Created by Rifqi Fadhlillah on 02/11/20.
//

import SwiftUI

public struct CirclePercentageProgressViewStyle: ProgressViewStyle {
	
	public var strokeWidth: CGFloat
	public var fontType: Font
	public var fontColor: Color
	public var primaryColor: Color
	public var secondaryColor: Color
	
	public init (
		strokeWidth: CGFloat = 10.0,
		fontType: Font = .title,
		fontColor: Color = Color.black,
		primaryColor: Color = Color.colorSecondary,
		secondaryColor: Color = Color.colorSecondary.opacity(0.5)) {
		self.strokeWidth = strokeWidth
		self.fontType = fontType
		self.fontColor = fontColor
		self.primaryColor = primaryColor
		self.secondaryColor = secondaryColor
	}
	
	public func makeBody(configuration: Configuration) -> some View {
		ZStack {
			ZStack {
				Circle()
					.trim(from: 0.0, to: 1.0)
					.stroke(style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
					.foregroundColor(secondaryColor)
				
				Circle()
					.trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
					.stroke(style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
					.foregroundColor(primaryColor)
			}
			.rotationEffect(.degrees(-90))
			
			Text("\(Int((configuration.fractionCompleted ?? 0) * 100))%")
				.font(fontType)
				.fontWeight(.medium)
				.foregroundColor(fontColor)
		}
		.background(Color.black)
		.clipShape(Circle())
	}
}

struct CirclePercentageProgressViewStyle_Previews: PreviewProvider {
	 static var previews: some View {
		VStack {
			ProgressView(value: 80, total: 100)
			.progressViewStyle(
			  CirclePercentageProgressViewStyle(
				 strokeWidth: 6,
				 fontType: .system(size: 8),
				 fontColor: Color.white,
				  primaryColor: .blue,
				secondaryColor: Color.gray)
			)
			.frame(width: 30, height: 30, alignment: .center)
			.offset(y: 15)
				.padding(.leading, 5)
		}
	 }
}

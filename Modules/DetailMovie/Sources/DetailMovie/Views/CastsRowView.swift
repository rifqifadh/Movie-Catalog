//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import SwiftUI
import TheMovieDBSDK
import SDWebImageSwiftUI

public struct CastsRowView: View {
	
	var casts: [CastModel]
	
	public init(casts: [CastModel]) {
		self.casts = casts
	}
	
	public var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Text("Cast")
				.font(.headline)
				.fontWeight(.semibold)
				.padding(.horizontal)
				.padding(.vertical)
		
			ScrollView(.horizontal, showsIndicators: false) {
				LazyHStack(alignment: .top, spacing: 12) {
					ForEach(casts) { cast in
						VStack(alignment: .center, spacing: 0) {
							WebImage(url: URL(string: cast.profile))
								.renderingMode(.original)
								.resizable()
								.placeholder {
									Rectangle()
										.foregroundColor(.gray)
										.frame(width: 70, height: 100)
								}
								.indicator(.activity)
								.cornerRadius(6)
								.aspectRatio(contentMode: .fit)
								.frame(width: 70, height: 100)
							
							Text(cast.name)
								.font(.caption)
								.lineLimit(1)
							
							Text(cast.character)
								.font(.caption)
								.foregroundColor(.secondary)
								.lineLimit(1)
							
						}
						.frame(width: 90)
					}
				}
				.padding(.horizontal)
			}
			.frame(height: 135)
		}
	}
}

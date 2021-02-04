//
//  SwiftUIView.swift
//  
//
//  Created by Rifqi Fadhlillah on 29/01/21.
//

import SwiftUI

public struct RatingStarView: View {
	@Binding public var rating: Int
	
	var label: String
	var maxRating: Int
	
	public init (rating: Binding<Int>, label: String = "", maxRating: Int = 5) {
		self._rating = rating
		self.label = label
		self.maxRating = maxRating
	}
	
	var offImage: Image?
	var onImage = Image(systemName: "star.fill")
	
	var offColor = Color.gray
	var onColor = Color.yellow
	
    public var body: some View {
		HStack {
			if label.isEmpty == false {
				Text(label)
			}
			
			ForEach(1..<maxRating + 1) { number in
				image(for: number)
					.foregroundColor(number > rating ? offColor : onColor)
					.onTapGesture {
						self.rating = number
					}
			}
		}
    }
	
	private func image(for number: Int) -> Image {
		if number > rating {
			return offImage ?? onImage
		} else {
			return onImage
		}
	}
}

struct RatingStarView_Previews: PreviewProvider {
    static var previews: some View {
		RatingStarView(rating: .constant(4))
    }
}

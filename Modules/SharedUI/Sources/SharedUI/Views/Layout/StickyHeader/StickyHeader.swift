//
//  SwiftUIView.swift
//  
//
//  Created by Rifqi Fadhlillah on 29/01/21.
//

import SwiftUI
import SDWebImageSwiftUI

public struct StickyHeader<Header: View, Content: View>: View {
	
	var heightHeader: CGFloat
	let header: () -> Header
	let content: () -> Content
	let dismiss: (() -> Void)?
	
	public init (
		heightHeader: CGFloat = 300,
		@ViewBuilder header: @escaping () -> Header,
		@ViewBuilder content: @escaping () -> Content,
		dismiss: (() -> Void)? = nil) {
		self.heightHeader = heightHeader
		self.header = header
		self.content = content
		self.dismiss = dismiss
	}
	
    public var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			GeometryReader { geo in
				ZStack(alignment: .topTrailing) {
					header()
						.frame(width: geo.size.width, height: self.getHeightForHeaderImage(geo))
						.blur(radius: self.getBlurRadiusForImage(geo), opaque: true)
						.clipped()
						.offset(x: 0, y: self.getOffsetForHeaderImage(geo))
					
					if let action = dismiss {
						Button(action: action, label: {
							ZStack(alignment: .center) {
								Circle()
									.fill(Color.gray.opacity(0.5))
								Image(systemName: "xmark")
									.foregroundColor(.white)
							}
						})
						.frame(width: 35, height: 35)
						.offset(x: -20.0, y: self.getOffsetButton(geo))
					}
				}
			}
			.frame(height: heightHeader)
			
			content()
		}
		.clipped()
		.edgesIgnoringSafeArea(.top)
    }
}

extension StickyHeader {
	private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
	  return geometry.frame(in: .global).minY
	}
	
	private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
	  return -getScrollOffset(geometry)
	  
	  // Image was pulled down
//	  if offset > 0 {
//		 return -offset
//	  }
//	  return 0
	}
	
	private func getOffsetButton(_ geometry: GeometryProxy) -> CGFloat {
		let offset = getScrollOffset(geometry)
		
		return -offset + 35
	}
	
	private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
	  let offset = getScrollOffset(geometry)
	  let imageHeight = geometry.size.height
	  
	  if offset > 0 {
		 return offset + heightHeader
	  }
	  
	  return imageHeight
	}
	
	private func getBlurRadiusForImage(_ geometry: GeometryProxy) -> CGFloat {
	  let offset = geometry.frame(in: .global).maxY
	  
	  let height = geometry.size.height
	  let blur = (height - max(offset, 0)) / height
	  
	  return blur * 6
	}
}

// MARK: - Example
struct StickyHeader_Previews: PreviewProvider {
    static var previews: some View {
		StickyHeader {
			Rectangle()
				.fill(Color.blue)
		} content: {
			VStack(alignment: .leading, spacing: 8) {
				Text("Lorem Ipsum")
					.font(.title)
					.fontWeight(.bold)
				RatingStarView(rating: .constant(4))
					.font(.caption)
				Text(plot)
					.padding(.top)
			}
			.padding(.top, 25)
			.padding(.horizontal)
			.background(Color.white)
			.cornerRadius(20)
			.offset(y: -35)
		} dismiss: {
			print("dismiss")
		}
		.edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
var plot = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
#endif

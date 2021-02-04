//
//  SwiftUIView.swift
//  
//
//  Created by Rifqi Fadhlillah on 31/01/21.
//

import SwiftUI

public struct CapsuleTabView<Content> : View where Content : View {
	
	var tabsItem: [String] = []
	var selection: Binding<String>?
	let content: () -> Content
	
	public init(
		_ tabsItem: [String],
		selection: Binding<String>?,
		@ViewBuilder content: @escaping () -> Content) {
		self.tabsItem = tabsItem
		self.selection = selection
		self.content = content
	}
	
	public var body: some View {
		VStack {
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 0) {
					ForEach(tabsItem, id: \.self) {  tab in
						CapsuleTabButton(title: tab, selectedTab: selection ?? .constant(tabsItem[0]))
					}
				}
			}
			
			TabView(selection: selection) {
				content()
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
		}
	}
}

struct CapsuleTabButton: View {
	
	var title: String
	@Binding var selectedTab: String
	
	var body: some View {
		Button {
			selectedTab = title
		} label: {
			Text("\(title)")
				.fontWeight(.medium)
				.font(.caption)
				.foregroundColor(foregroundColor())
				.padding(.horizontal)
				.padding(.vertical, 8)
				.background(backgroundColor())
		}
		.padding(.vertical, 3)
	}
	
	func backgroundColor() -> Color {
		return selectedTab == title ? Color.accentColor : Color.white
	}
	
	func foregroundColor() -> Color {
		return selectedTab == title ? Color.white : Color.accentColor
	}
	
	func borderColor() -> Color {
		return selectedTab == title ? Color.accentColor : Color.accentColor
	}
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
		CapsuleTabView(["Now Playing", "Top Rated"], selection: .constant("Now Playing")) {
			Text("Now Playing")
				.tag("Now Playing")
			
			Text("Top Rated")
				.tag("Top Rated")
		}
    }
}

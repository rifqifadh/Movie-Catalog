//
//  SwiftUIView.swift
//  
//
//  Created by Rifqi Fadhlillah on 31/01/21.
//

import SwiftUI

struct TabBarView<Content> : View where Content : View {
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
						TabBarButton(title: tab, selectedTab: selection ?? .constant(tabsItem[0]))
					}
				}
			}
			.padding(.top, 10)
			
			TabView(selection: selection) {
				content()
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
		}
	}
}

struct TabBarButton: View {
	
	var title: String
	@Binding var selectedTab: String
	
	var body: some View {
		Button {
			selectedTab = title
		} label: {
			VStack(spacing: 8) {
				
				HStack(spacing: 12) {
					
					Text("\(title)")
						.foregroundColor(selectedTab == title ? Color.accentColor : Color.secondary)
				}
				
				Capsule()
					.fill(selectedTab == title ? Color.accentColor : Color.clear)
					.frame(height: 4)
			}
		}
		.padding(.horizontal)
		.padding(.bottom, 5)
		.background(Color.white)
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

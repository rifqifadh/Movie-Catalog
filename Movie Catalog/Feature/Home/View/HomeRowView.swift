////
////  HomeRow.swift
////  Movie DB
////
////  Created by Rifqi Fadhlillah on 03/11/20.
////
//
//import SwiftUI
//import Home
//import SharedUI
//
//struct HomeRowView: View {
//	@ObservedObject var viewModel: HomeViewModel
//	
//	var title: String
//	var items: [MovieModel]
//	
//	var body: some View {
//		VStack(alignment: .leading) {
//			Text(self.title)
//				.font(.title3)
//				.fontWeight(.medium)
//				.padding(.leading, 15)
//				.padding(.top, 16)
//			
//			ScrollView(.horizontal, showsIndicators: false) {
//				LazyHStack(alignment: .top, spacing: 12) {
//					ForEach(items) { movie in
//						ZStack {
//							linkBuilder(for: movie) {
//								MovieCardView(item: movie, width: 120)
//									.redacted(reason: viewModel.isLoading ? .placeholder : [])
//							}.buttonStyle(PlainButtonStyle())
//						}
//					}
//				}
//				.padding(.horizontal)
//			}
//		}
//	}
//}
//
//// MARK: Link Builder
//extension HomeRowView {
//	func linkBuilder<Content: View>(for movie: MovieModel, @ViewBuilder content: () -> Content) -> some View {
//		NavigationLink(
//			destination: HomeRouter().makeDetailView(for: movie)) {
//			content()
//		}
//	}
//}

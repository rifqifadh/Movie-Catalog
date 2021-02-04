//
//  HomeViewModel.swift
//  Movie Catalog
//
//  Created by Rifqi Fadhlillah on 29/01/21.
//

import SwiftUI
import Combine
import Core
import Movie
import Networking

final class MoviesViewModel: ObservableObject {
	
	private var cancellables = Set<AnyCancellable>()
	let useCase: Interactor<String, MoviesModel, GetMoviesRepository<GetMoviesRemoteDataSource, MoviesTransformer>> = Injection.init().provideMovies()
	let presenter: GetListMoviesPresenter<String, MoviesModel, Interactor<String, MoviesModel, GetMoviesRepository<GetMoviesRemoteDataSource, MoviesTransformer>>>
	
	@Published private(set) var movies: [MovieModel] = []
	@Published private(set) var homeSection = [HomeSection: [MovieModel]]()
	@Published private(set) var isLoading = false
	@Published private(set) var errorMessage = ""
	
	init() {
		presenter = GetListMoviesPresenter(useCase: useCase)
	}
	
	func getMovieSection() {
		isLoading = true
		Publishers.Zip4(
			presenter.getListMovies(path: "now_playing"),
			presenter.getListMovies(path: "top_rated"),
			presenter.getListMovies(path: "popular"),
			presenter.getListMovies(path: "upcoming"))
			.receive(on: RunLoop.main)
			.sink { completion in
				switch completion {
				case .finished:
					self.isLoading = false
				case .failure(let error):
					self.errorMessage = error.localizedDescription
				}
			} receiveValue: { nowPlaying, topRated, popular, upcoming in
				let movieResults = [nowPlaying.results, topRated.results, popular.results, upcoming.results]
				let mapToDict = Dictionary(keys: HomeSection.allCases.sorted(by: <), values: movieResults)
				self.homeSection = mapToDict
			}
			.store(in: &cancellables)

	}
}

enum HomeSection: String, CaseIterable, Comparable {
  case NowPlaying = "Now Playing"
  case TopRated = "Top Rated"
  case Popular
  case Upcoming
  
  private var sortOrder: Int {
	 switch self {
	 case .NowPlaying:
		return 0
	 case .TopRated:
		return 1
	 case .Popular:
		return 2
	 case .Upcoming:
		return 3
	 }
  }
  
  static func < (lhs: HomeSection, rhs: HomeSection) -> Bool {
	lhs.sortOrder < rhs.sortOrder
  }
}

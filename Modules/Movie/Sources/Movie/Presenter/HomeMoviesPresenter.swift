//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 04/02/21.
//

import Combine
import SwiftUI
import Core

public class HomeMoviesPresenter<Response, Interactor: UseCase>
where Interactor.Request == String, Interactor.Response == MoviesModel {
	
	private var _useCase: Interactor
	private var cancellables = Set<AnyCancellable>()
	
	@Published private(set) var movies: [MovieModel] = []
	@Published private(set) var homeSection = [HomeSection: [MovieModel]]()
	@Published private(set) var isLoading = false
	@Published private(set) var errorMessage = ""
	
	public init(useCase: Interactor) {
		_useCase = useCase
	}
	
	public func getMovieSection() {
		isLoading = true
		Publishers.Zip4(
			_useCase.execute(request: "now_playing"),
			_useCase.execute(request: "top_rated"),
			_useCase.execute(request: "popular"),
			_useCase.execute(request: "upcoming"))
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

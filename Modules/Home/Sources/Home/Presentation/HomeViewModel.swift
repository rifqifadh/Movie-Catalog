//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Combine
import SwiftUI
import Core

public final class HomeViewModel: ObservableObject {
	
	private var _useCase: HomeUseCase
	private var cancellables = Set<AnyCancellable>()
	
	@Published public private(set) var homeSection = [HomeSection: [MovieModel]]()
	@Published public private(set) var isLoading = false
	@Published public private(set) var errorMessage = ""
	
	public init(useCase: HomeUseCase) {
		_useCase = useCase
	}
	
	public func getMoviesSection() {
		isLoading = true
		Publishers
			.Zip4(
			_useCase.getNowPlayingMovies(),
			_useCase.getTopRatedMovies(),
			_useCase.getPopularMovies(),
			_useCase.getUpcomingMovies()
		)
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

public enum HomeSection: String, CaseIterable, Comparable {
  case NowPlaying = "Now Playing"
  case TopRated = "Top Rated"
  case Popular
  case Upcoming
  
  public var sortOrder: Int {
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
  
	public static func < (lhs: HomeSection, rhs: HomeSection) -> Bool {
	lhs.sortOrder < rhs.sortOrder
  }
}

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import SwiftUI
import Combine
import TheMovieDBSDK

public final class DetailMoviePresenter: ObservableObject {
	
	private var _useCase: DetailMovieUseCase
	private var cancellables = Set<AnyCancellable>()
	private var _movieModel: MovieModel
	
	@Published public private(set) var movie: DetailMovieModel?
	@Published public private(set) var recommendationMovies: [MovieModel] = []
	@Published public private(set) var castMovie: [CastModel] = []
	@Published public private(set) var isLoadingDetail = false
	@Published public private(set) var isLoadingMovies = false
	@Published public private(set) var isLoadingCredits = false
	@Published public private(set) var isFavorite = false
	@Published public private(set) var errorMessage = ""
	@Published public private(set) var successAddToFav = false
	@Published public var alertConfirmDelete = false
	
	public init(
		useCase: DetailMovieUseCase,
		movie: MovieModel) {
		_useCase = useCase
		_movieModel = movie
	}
	
	public func getMovie(with id: Int) {
		isLoadingDetail = true
		_useCase.getMovie(with: String(id))
			.receive(on: RunLoop.main)
			.sink { completion in
				switch completion {
				case .finished:
					self.isLoadingDetail = false
				case .failure(let error):
					self.errorMessage = error.localizedDescription
				}
			} receiveValue: { movie in
				self.movie = movie
			}
			.store(in: &cancellables)
	}
	
	public func getRecommendationMovies(id: Int) {
		isLoadingMovies = true
		_useCase.getRecommendationMovies(with: String(id))
			.receive(on: RunLoop.main)
			.sink { completion in
				switch completion {
				case .finished:
					self.isLoadingMovies = false
				case .failure(let error):
					self.errorMessage = error.localizedDescription
				}
			} receiveValue: { movies in
				self.recommendationMovies = movies.results
			}
			.store(in: &cancellables)
	}
	
	public func getCredits(id: Int) {
		isLoadingCredits = true
		_useCase.getCredits(with: String(id))
			.receive(on: RunLoop.main)
			.sink { completion in
				switch completion {
				case .finished:
					self.isLoadingCredits = false
				case .failure(let error):
					self.errorMessage = error.localizedDescription
				}
			} receiveValue: { credits in
				self.castMovie = credits.cast
			}
			.store(in: &cancellables)
	}
	
	public func addToFavorite() {
		_useCase.addToFavorite(movie: _movieModel)
			.receive(on: RunLoop.main)
			.sink { completion in
				switch completion {
				case .finished:
					self.successAddToFav = true
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
						self.successAddToFav = false
					}
				case .failure(let error):
					self.errorMessage = error.localizedDescription
				}
			} receiveValue: { result in
				self.isFavorite = result
			}
			.store(in: &cancellables)
	}
	
	public func isFavoriteMovie() {
		_useCase.isFavorite(id: String(_movieModel.id))
			.receive(on: RunLoop.main)
			.sink(receiveValue: { result in
				self.isFavorite = result
			})
			.store(in: &cancellables)
	}
	
	public func deleteFromFavorite() {
		alertConfirmDelete = false
		_useCase.deleteFromFavorite(id: String(_movieModel.id))
			.receive(on: RunLoop.main)
			.sink { completion in
				switch completion {
				case .finished:
					print("delete from favorite")
				case .failure(let error):
					print(error.localizedDescription)
					self.errorMessage = error.localizedDescription
				}
			} receiveValue: { result in
				self.isFavorite = !result
			}
			.store(in: &cancellables)
	}
	
	public func actionFavoriteButton() {
		if isFavorite {
			alertConfirmDelete = true
		} else {
			addToFavorite()
		}
	}
}

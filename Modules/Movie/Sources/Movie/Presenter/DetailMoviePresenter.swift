//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import Core
import Combine
import Foundation
import SwiftUI

public class DetailMoviePresenter: ObservableObject {
	
	private var _useCase: DetailMovieUseCase
	private var cancellables = Set<AnyCancellable>()
	private var _movieModel: MovieModel
	
	@Published public private(set) var movie: DetailMovieModel?
	@Published public private(set) var recommendationMovies: [MovieModel] = []
	@Published public private(set) var isLoadingDetail = false
	@Published public private(set) var isLoadingMovies = false
	@Published public private(set) var isFavorite = false
	@Published public private(set) var errorMessage = ""
	
	public init(
		useCase: DetailMovieUseCase,
		movie: MovieModel) {
		_useCase = useCase
		_movieModel = movie
	}
	
	public func getMovie(id: Int) {
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
	
	public func addToFavorite() {
		_useCase.addToFavorite(movie: _movieModel)
			.receive(on: RunLoop.main)
			.sink { completion in
				switch completion {
				case .finished:
					print("finish")
				case .failure(let error):
					self.errorMessage = error.localizedDescription
				}
			} receiveValue: { result in
				self.isFavorite = result
			}
			.store(in: &cancellables)
	}
	
}

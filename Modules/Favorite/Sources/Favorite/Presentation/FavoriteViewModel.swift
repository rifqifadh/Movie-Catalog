//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import Core
import SwiftUI
import Combine

public final class FavoriteViewModel: ObservableObject {
	
	private var _useCase: FavoriteUseCase
	private var cancellables = Set<AnyCancellable>()
	
	@Published public private(set) var movies: [MovieModel] = []
	
	public init(useCase: FavoriteUseCase) {
		_useCase = useCase
	}
	
	public func getFavoriteMovies() {
		_useCase.getFavoriteMovies()
			.subscribe(on: RunLoop.main)
			.sink { completion in
				switch completion {
				case .finished:
					print("Finished")
				case .failure(let error):
					print(error.localizedDescription)
				}
			} receiveValue: { movies in
				self.movies = movies
			}
			.store(in: &cancellables)
	}
}

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import Foundation
import Combine
import Core

public protocol FavoriteUseCase {
	
	func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
}

final public class FavoriteInteractor: FavoriteUseCase {
	private let _repository: MovieRepository
	
	public required init(repository: MovieRepository) {
		_repository = repository
	}
	
	public func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
		return _repository.getFavoriteMovies()
			.eraseToAnyPublisher()
	}
}

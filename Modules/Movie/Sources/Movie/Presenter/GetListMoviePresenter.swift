//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 08/12/20.
//

import Combine
import SwiftUI
import Core

public class GetListMoviesPresenter<Request, Response, Interactor: UseCase>
where Interactor.Request == Request, Interactor.Response == Response {
	
	private var _useCase: Interactor
	
	public init(useCase: Interactor) {
		_useCase = useCase
	}
	
	public func getListMovies(path: Request) -> AnyPublisher<Response, Error> {
		return _useCase.execute(request: path)
			.eraseToAnyPublisher()
	}
	
	public func getMovieSection() {
		
	}
}

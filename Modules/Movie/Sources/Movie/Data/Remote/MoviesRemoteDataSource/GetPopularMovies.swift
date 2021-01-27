//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 03/12/20.
//

import Foundation
import Combine
import Core
import Networking

public struct GetPopularMovies: DataSource {
  public typealias Request = Any
  public typealias Response = MovieResponses
  
  public func execute(request: Any?) -> AnyPublisher<MovieResponses, Error> {
    NetworkService.request(.popularMovies, response: MovieResponses.self)
      .eraseToAnyPublisher()
  }
}

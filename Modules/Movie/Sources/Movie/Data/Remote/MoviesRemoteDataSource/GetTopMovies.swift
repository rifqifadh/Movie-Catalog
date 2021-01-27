//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation
import Core
import Combine
import Networking

public struct GetTopMovies: DataSource {
  
  public typealias Request = Any
  public typealias Response = MovieResponses
  
  public func execute(request: Any?) -> AnyPublisher<MovieResponses, Error> {
    NetworkService.request(.topRatedMovie, response: MovieResponses.self)
      .eraseToAnyPublisher()
  }
}

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 03/12/20.
//

import Foundation
import Core
import Combine
import Networking

public struct GetUpcomingMovies: DataSource {
  
  public typealias Request = Any
  public typealias Response = MovieResponses
  
  public func execute(request: Any?) -> AnyPublisher<MovieResponses, Error> {
    NetworkService.request(.upcomingMovies, response: MovieResponses.self)
      .eraseToAnyPublisher()
  }
}

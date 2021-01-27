//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 03/12/20.
//

import Foundation
import Networking
import Core
import Combine

public struct GetNowPlayingMovies: DataSource {
  public typealias Request = Any
  public typealias Response = MovieResponses
  
  public func execute(request: Any?) -> AnyPublisher<MovieResponses, Error> {
    NetworkService.request(.nowPlayingMovie, response: MovieResponses.self)
      .eraseToAnyPublisher()
  }
}

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation
import Networking

extension Endpoint {
  
  static var topRatedMovie: Self {
    Endpoint(path: "movie/top_rated")
  }
  
  static var nowPlayingMovie: Self {
    Endpoint(path: "movie/now_playing")
  }
  
  static var popularMovies: Self {
    Endpoint(path: "movie/popular")
  }
  
  static var upcomingMovies: Self {
    Endpoint(path: "movie/upcoming")
  }
}

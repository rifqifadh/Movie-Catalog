//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import Networking

extension Endpoint {
  
	static func getNowPlayingMovies() -> Self {
		Endpoint(path: "/movie/now_playing")
	}
	
	static func getTopRatedMovies() -> Self {
		Endpoint(path: "/movie/top_rated")
	}
	
	static func getPopularMovies() -> Self {
		Endpoint(path: "/movie/popular")
	}
	
	static func getUpcomingMovies() -> Self {
		Endpoint(path: "/movie/upcoming")
	}
	
	static func getMovie(id: String) -> Self {
		Endpoint(path: "/movie/\(id)")
	}
	
	static func getRecommendationMovies(id: String) -> Self {
		Endpoint(path: "/movie/\(id)/recommendations")
	}
	
	static func getCredits(id: String) -> Self {
		Endpoint(path: "/movie/\(id)/credits")
	}
}

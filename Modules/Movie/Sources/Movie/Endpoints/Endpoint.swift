//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation
import Networking

extension Endpoint {
  
	static func getMovies(path: String) -> Self {
		Endpoint(path: "/movie/\(path)")
	}
	
	static func getMovie(id: String) -> Self {
		Endpoint(path: "/movie/\(id)")
	}
	
	static func getRecommendationMovies(id: String) -> Self {
		Endpoint(path: "/movie/\(id)/recommendations")
	}
}

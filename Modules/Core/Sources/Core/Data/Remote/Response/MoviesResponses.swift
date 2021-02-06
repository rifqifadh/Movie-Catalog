//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation

public struct MoviesResponses: Codable {
  
	public let page: Int?
	public let results: [MoviesResponse]
}

public struct MoviesResponse: Codable {
  
	public let id: Int?
	public let title: String?
	public let overview: String?
	public let voteAverage: Double?
	public let posterPath: String?
	public let backdropPath: String?
	public let releaseDate: String?
  
}

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import Foundation

public struct MovieResponse: Codable {
	
	public let id: Int?
	public let title: String?
	public let overview: String?
	public let voteAverage: Double?
	public let voteCount: Int?
	public let posterPath: String?
	public let backdropPath: String?
	public let releaseDate: String?
	public let tagline: String?
	public let homepage: String?
	public let genres: [GenreResponse]
	public let imdbId: String?
	public let runtime: Int?
}

public struct GenreResponse: Codable {
	public let id: Int
	public let name: String
}

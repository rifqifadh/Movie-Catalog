//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import Foundation

public struct MovieResponse: Codable {
	
	let id: Int?
	let title: String?
	let overview: String?
	let voteAverage: Double?
	let voteCount: Int?
	let posterPath: String?
	let backdropPath: String?
	let releaseDate: String?
	let tagline: String?
	let homepage: String?
	let genres: [GenreResponse]
	let imdbId: String?
	let runtime: Int?
}

public struct GenreResponse: Codable {
	let id: Int
	let name: String
}

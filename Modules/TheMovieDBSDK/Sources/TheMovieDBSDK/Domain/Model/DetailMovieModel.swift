//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import Core

public struct DetailMovieModel: Decodable {
	
	public let id: Int
		public let title: String
		public let overview: String
		public let voteAverage: Double
		public let voteCount: Int
		public let posterPath: String
		public var posterUrl: URL {
			URL(string: Constants.TMDBEnv.imageUrl(size: "w500") + posterPath)!
		}
		public let backdropPath: String
		public var backdropUrl: URL {
		  URL(string: Constants.TMDBEnv.imageUrl(size: "w500") + backdropPath)!
		}
		public let releaseDate: String
		public var releaseDateFormatted: String {
			let date = releaseDate.toDate()
			return date.toString(format: "MMM dd, yyyy")
		}
		public let tagline: String
		public let homepage: String
		public let genres: [GenreModel]?
		public var genresName: [String] {
			guard let genreString = genres else { return [""]}
			return genreString.map { $0.name }
		}
		public let imdbId: String
		public let runtime: Int
}

public struct GenreModel: Decodable {
	let id: Int
	let name: String
}

#if DEBUG
extension DetailMovieModel {
	public static var `default`: DetailMovieModel {
		DetailMovieModel(id: 0, title: "Captain",
							  overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.",
							  voteAverage: 7.0, voteCount: 500, posterPath: "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", backdropPath: "/srYya1ZlI97Au4jUYAktDe3avyA.jpg", releaseDate: "2020-12-16", tagline: "A new era of wonder begins.", homepage: "https://www.warnerbros.com/movies/wonder-woman-1984", genres: [], imdbId: "tt7126948", runtime: 110)
	}
}
#endif

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 04/02/21.
//

import Foundation

struct DetailMovieMapper {
	
	static func transformResponseToDomain(response: MovieResponse) -> DetailMovieModel {
		return DetailMovieModel(
			id: response.id ?? 0,
			title: response.title ?? "",
			overview: response.overview ?? "",
			voteAverage: response.voteAverage ?? 0,
			voteCount: response.voteCount ?? 0,
			posterPath: response.posterPath ?? "",
			backdropPath: response.backdropPath ?? "",
			releaseDate: response.releaseDate ?? "",
			tagline: response.tagline ?? "",
			homepage: response.homepage ?? "",
			genres: response.genres.map { GenreModel(id: $0.id, name: $0.name) },
			imdbId: response.imdbId ?? "",
			runtime: response.runtime ?? 0)
	}
}

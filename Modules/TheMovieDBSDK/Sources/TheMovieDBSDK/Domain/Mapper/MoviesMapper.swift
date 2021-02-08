//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation

struct MoviesMapper {
	
	static func transformResponseToDomain(response: MoviesResponses) -> MoviesModel {
		return MoviesModel(
			page: response.page,
			results: response.results.map { results in
				MovieModel(
					id: results.id ?? 0,
					title: results.title ?? "",
					overview: results.overview ?? "",
					voteAverage: results.voteAverage ?? 0,
					posterPath: results.posterPath ?? "",
					backdropPath: results.backdropPath ?? "",
					releaseDate: results.releaseDate ?? ""
				)
			})
	}
	
}

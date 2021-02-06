//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation

struct MovieMapper {
	
	static func transformDomainToEntity(domain: MovieModel) -> MovieEntity {
		let entity = MovieEntity()
		entity.id = domain.id
		entity.title = domain.title
		entity.overview = domain.overview
		entity.voteAverage = domain.voteAverage
		entity.posterPath = domain.posterPath
		entity.backdropPath = domain.backdropPath
		entity.releaseDate = domain.releaseDate
		return entity
	}
	
	static func transformEntityToDomain(entity: [MovieEntity]) -> [MovieModel] {
		return entity.map { result in
			return MovieModel(
				id: result.id,
				title: result.title,
				overview: result.overview,
				voteAverage: result.voteAverage,
				posterPath: result.posterPath,
				backdropPath: result.backdropPath,
				releaseDate: result.releaseDate
			)
		}
	}
}

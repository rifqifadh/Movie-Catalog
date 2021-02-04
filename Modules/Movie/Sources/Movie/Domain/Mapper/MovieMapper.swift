//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/02/21.
//

import Core

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
	
	static func transformEntityToDomain(entity: MovieEntity) -> MovieModel {
		return MovieModel(
			id: entity.id,
			title: entity.title,
			overview: entity.overview,
			voteAverage: entity.voteAverage,
			posterPath: entity.posterPath,
			backdropPath: entity.backdropPath,
			releaseDate: entity.releaseDate
		)
	}
}

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
}

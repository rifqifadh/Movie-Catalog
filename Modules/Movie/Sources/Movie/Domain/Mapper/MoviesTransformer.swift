//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 04/12/20.
//

import Core

public struct MoviesTransformer: Mapper {
	
	public typealias Response = MoviesResponses
	public typealias Entity = [MovieEntity]?
	public typealias Domain = MoviesModel
	
	public init() {}
	
	public func transformResponseToDomain(response: MoviesResponses) -> MoviesModel {
		return MoviesModel(
			page: response.page,
			results: response.results.map {
				return MovieModel(
					id: $0.id ?? 0,
					title: $0.title ?? "",
					overview: $0.overview ?? "",
					voteAverage: $0.voteAverage ?? 0,
					posterPath: $0.posterPath ?? "",
					backdropPath: $0.backdropPath ?? "",
					releaseDate: $0.releaseDate ?? ""
				)
			})
	}
	
	public func transformDomainToEntity(domain: MoviesModel) -> [MovieEntity]? {
		return nil
	}
}

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import Foundation
import Combine
import Core

public struct GetRecommendationMoviesRepository<
	RemoteDataSource: DataSource,
	Transformer: Mapper>: Repository where
	RemoteDataSource.Request == String,
	RemoteDataSource.Response == MoviesResponses,
	Transformer.Response == MoviesResponses,
	Transformer.Domain == MoviesModel {

  public typealias Request = String
  public typealias Response = MoviesModel

  private let _remoteDataSource: RemoteDataSource
  private let _mapper: Transformer

  public init(
	 remoteDataSource: RemoteDataSource,
	 mapper: Transformer) {
	 _remoteDataSource = remoteDataSource
	 _mapper = mapper
  }

	public func execute(request: String?) -> AnyPublisher<MoviesModel, Error> {
		return _remoteDataSource.execute(request: request)
			.map { _mapper.transformResponseToDomain(response: $0) }
			.eraseToAnyPublisher()
	}
}

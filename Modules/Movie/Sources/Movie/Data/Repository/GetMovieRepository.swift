//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 01/02/21.
//

import Foundation
import Combine
import Core

public struct GetMovieRepository<
	RemoteDataSource: DataSource,
	Transformer: Mapper>: Repository where
	RemoteDataSource.Request == String,
	RemoteDataSource.Response == MovieResponse,
	Transformer.Response == MovieResponse,
	Transformer.Domain == DetailMovieModel {
	
	public typealias Request = String
	public typealias Response = DetailMovieModel
	
	private let _remoteDataSource: RemoteDataSource
	private let _mapper: Transformer

	public init(
	  remoteDataSource: RemoteDataSource,
	  mapper: Transformer) {
	  _remoteDataSource = remoteDataSource
	  _mapper = mapper
	}
	
	public func execute(request: String?) -> AnyPublisher<DetailMovieModel, Error> {
		return _remoteDataSource.execute(request: request!)
			.map { _mapper.transformResponseToDomain(response: $0) }
			.eraseToAnyPublisher()
	}
	
}

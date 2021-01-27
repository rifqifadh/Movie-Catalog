//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 03/12/20.
//

import Foundation
import Combine
import Core

public struct GetMoviesRepository<
  MoviesLocaleDataSource: LocaleDataSource,
  RemoteDataSource: DataSource,
  Transformer: Mapper>: Repository
where
  MoviesLocaleDataSource.Response == MovieEntity,
  RemoteDataSource.Response == [MovieResponse],
  Transformer.Response == [MovieResponse],
  Transformer.Entity == [MovieEntity],
  Transformer.Domain == [MovieDomainModel] {
  
  public typealias Request = Any
  public typealias Response = [MovieDomainModel]
  
  private let _localeDataSource: MoviesLocaleDataSource
  private let _remoteDataSource: RemoteDataSource
  private let _mapper: Transformer
  
  public init(
    localeDataSource: MoviesLocaleDataSource,
    remoteDataSource: RemoteDataSource,
    mapper: Transformer) {
    
    _localeDataSource = localeDataSource
    _remoteDataSource = remoteDataSource
    _mapper = mapper
  }
  
  public func execute(request: Any?) -> AnyPublisher<[MovieDomainModel], Error> {
    _remoteDataSource.execute(request: nil)
      .map { _mapper.transformResponseToDomain(response: $0)}
      .eraseToAnyPublisher()
  }
}

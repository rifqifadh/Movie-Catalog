//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 04/12/20.
//

import Core

public enum HomeSection: String, CaseIterable, Comparable {
  case TopRated = "Top Rated"
  case Popular
  case NowPlaying = "Now Playing"
  case Upcoming
  
  private var sortOrder: Int {
    switch self {
    case .TopRated:
      return 0
    case .Popular:
      return 1
    case .NowPlaying:
      return 2
    case .Upcoming:
      return 3
    }
  }
  
  public static func < (lhs: HomeSection, rhs: HomeSection) -> Bool {
    lhs.sortOrder < rhs.sortOrder
  }
}

public struct MovieTransformer: Mapper {
  public typealias Response = [MovieResponse]
  public typealias Entity = [MovieEntity]?
  public typealias Domain = [MovieDomainModel]

  public func transformResponseToDomain(response: [MovieResponse]) -> [MovieDomainModel] {
    return response.map {
      return MovieDomainModel(
        id: $0.id ?? 0,
        title: $0.title ?? "",
        overview: $0.overview ?? "",
        voteAverage: $0.voteAverage ?? 0,
        posterPath: $0.posterPath ?? "",
        backdropPath: $0.backdropPath ?? "",
        releaseDate: $0.releaseDate ?? ""
      )
    }
  }
  
  public func transformDomainToEntity(domain: [MovieDomainModel]) -> [MovieEntity]? {
    return nil
  }
}

extension MovieTransformer {
  
  public func transformMovieEntityToMovieSection(
    entity1: [MovieResponse],
    entity2: [MovieResponse],
    entity3: [MovieResponse],
    entity4: [MovieResponse]
  ) -> [HomeSection: [MovieDomainModel]] {
    
    let moviesMapped = [entity1, entity2, entity3, entity3, entity3].map {
      return transformResponseToDomain(response: $0)
    }
    
    let mapToDict = Dictionary(keys: HomeSection.allCases, values: moviesMapped)
    
    return mapToDict
  }
}

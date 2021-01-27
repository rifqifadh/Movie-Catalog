//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 08/12/20.
//

import Foundation
import Networking
import Core

public struct MovieDomainModel: Identifiable, Equatable {
  
  public let id: Int
  public let title: String
  public let overview: String
  public let voteAverage: Double
  public var rating: Float16 {
    Float16(voteAverage * 10)
  }
  public let posterPath: String
  public var poster: String {
    Constants.TMDBEnv.imageUrl(size: "w500") + posterPath
  }
  public let backdropPath: String
  public var backdrop: String {
    Constants.TMDBEnv.imageUrl(size: "w500") + backdropPath
  }
  public let releaseDate: String
  public var releaseDateFormatted: String {
    let date = releaseDate.toDate()
    return date.toString(format: "MMM dd,yyyy")
  }
}

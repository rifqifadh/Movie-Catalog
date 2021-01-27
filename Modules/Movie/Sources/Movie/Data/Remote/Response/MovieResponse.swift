//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation

public struct MovieResponses: Codable {
  
  let page: Int?
  let results: [MovieResponse]
}

public struct MovieResponse: Codable {
  
  let id: Int?
  let title: String?
  let overview: String?
  let voteAverage: Double?
  let posterPath: String?
  let backdropPath: String?
  let releaseDate: String?
  
}

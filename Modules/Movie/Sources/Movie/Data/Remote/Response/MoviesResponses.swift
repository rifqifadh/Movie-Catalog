//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation

public struct MoviesResponses: Codable {
  
  let page: Int?
  let results: [MoviesResponse]
}

public struct MoviesResponse: Codable {
  
  let id: Int?
  let title: String?
  let overview: String?
  let voteAverage: Double?
  let posterPath: String?
  let backdropPath: String?
  let releaseDate: String?
  
}

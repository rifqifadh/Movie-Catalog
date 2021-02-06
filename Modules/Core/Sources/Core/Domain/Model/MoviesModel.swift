//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 06/02/21.
//

import Foundation
import Networking
import SwiftUI

public struct MoviesModel: Identifiable, Equatable, Codable {
	public var id = UUID()
	public let page: Int?
	public let results: [MovieModel]
}

public struct MovieModel: Identifiable, Equatable, Codable {
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
	public var ratingProgressColor: Color {
		switch voteAverage {
		case 7...10:
			return .green
		case 5..<7:
			return .yellow
		case 0..<5:
			return .red
		default:
			return .gray
		}
	}
	public var isFavorite: Bool = false
}

#if DEBUG
extension MovieModel {
	public static var `default`: MovieModel { MovieModel(id: 0, title: "Roald Dahl's The Witches", overview: "", voteAverage: 7.1, posterPath: "/betExZlgK0l7CZ9CsCBVcwO1OjL.jpg", backdropPath: "", releaseDate: "")}
	
	public static var `default2`: MovieModel { MovieModel(id: 2, title: "Roald Dahl's The Witches", overview: "", voteAverage: 7.1, posterPath: "/betExZlgK0l7CZ9CsCBVcwO1OjL.jpg", backdropPath: "", releaseDate: "")}
}
#endif

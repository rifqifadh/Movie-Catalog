//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 08/12/20.
//

import Foundation

public struct Constants {
  
  public struct TMDBEnv {
    public static var baseUrl = "api.themoviedb.org/3"
    public static var apiKey = "967ad60bd20b9b2102526183323e3c3b"
    public static func imageUrl(size: String) -> String {
      "https://image.tmdb.org/t/p/\(size)"
    }
  }
}

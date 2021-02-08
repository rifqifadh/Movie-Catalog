//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 08/12/20.
//

import Foundation

public struct Constants {
  
  public struct TMDBEnv {
    public static var baseUrl = "api.themoviedb.org"
    public static func imageUrl(size: String) -> String {
      "https://image.tmdb.org/t/p/\(size)"
    }
  }
}

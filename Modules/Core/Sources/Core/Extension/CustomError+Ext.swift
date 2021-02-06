//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 30/11/20.
//

import Foundation

public enum URLError: LocalizedError {
 
  case invalidResponse
  case addressUnreachable(URL)
  
    public var errorDescription: String? {
    switch self {
    case .invalidResponse: return "Server Error, please try again later."
    case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
    }
  }
}
 
public enum DatabaseError: LocalizedError {
 
  case invalidInstance
  case requestFailed
  
    public var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }
}

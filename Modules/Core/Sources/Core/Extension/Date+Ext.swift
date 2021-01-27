//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 08/12/20.
//

import Foundation

extension Date {
  public func toString(format: String = "yyyy-MM-dd") -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.dateFormat = format
    return formatter.string(from: self)
  }
}

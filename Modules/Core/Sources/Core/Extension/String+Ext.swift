//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 08/12/20.
//

import Foundation

extension String {
  public func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Take a look to your format")
    }
    return date
  }
}

//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 08/12/20.
//

import Foundation

extension Dictionary {
  public init(keys: [Key], values: [Value]) {
    precondition(keys.count == values.count)
    
    self.init()
    
    for (index, key) in keys.enumerated() {
      self[key] = values[index]
    }
  }
}

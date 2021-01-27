//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 30/11/20.
//

import Combine

public protocol Repository {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}

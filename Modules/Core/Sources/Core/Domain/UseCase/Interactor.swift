//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 30/11/20.
//

import Foundation
import Combine

public struct Interactor<Request, Response, R: Repository>: UseCase
where R.Request == Request, R.Response == Response {

  private let _respository: R
  
  public init(repository: R) {
    _respository = repository
  }
  
  public func execute(request: Request?) -> AnyPublisher<Response, Error> {
    _respository.execute(request: request)
  }
}

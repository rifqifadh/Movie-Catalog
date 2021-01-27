//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 30/11/20.
//

import Foundation

public protocol Mapper {
  associatedtype Response
  associatedtype Entity
  associatedtype Domain
  
  func transformResponseToDomain(response: Response) -> Domain
  func transformDomainToEntity(domain: Domain) -> Entity
}

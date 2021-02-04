//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 30/11/20.
//

import Combine
import Foundation

public protocol LocaleDataSource {
	associatedtype Request
	associatedtype Response
	
	func list(request: Request?) -> AnyPublisher<[Response], Error>
	func add(entities: Response) -> AnyPublisher<Bool, Error>
	func get(id: Request?) -> AnyPublisher<Response, Error>
	func delete(id: Request?) -> AnyPublisher<Bool, Error>
	func update(id: Request?, entity: Response) -> AnyPublisher<Bool, Error>
}

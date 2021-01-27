//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation
import Core
import RealmSwift
import Combine

public struct GetMoviesDataSource: LocaleDataSource {
  
  public typealias Request = Any
  public typealias Response = MovieEntity
  
  private let _realm: Realm?
  
  public init(realm: Realm?) {
    _realm = realm
  }
  
  public func list(request: Any?)
  -> AnyPublisher<[MovieEntity], Error> {
    return Future<[MovieEntity], Error> { completion in
      if let realm = _realm {
        let movies: Results<MovieEntity> = {
          realm.objects(MovieEntity.self)
            .sorted(byKeyPath: "id", ascending: true)
        }()
        completion(.success(movies.toArray(ofType: MovieEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }
    .eraseToAnyPublisher()
  }
  
  public func add(entities: MovieEntity) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = _realm {
        do {
          try realm.write {
            realm.add(entities, update: .modified)
          }
          completion(.success(true))
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }
    .eraseToAnyPublisher()
  }
  
  public func get(id: String) -> AnyPublisher<MovieEntity, Error> {
    fatalError()
  }
  
  public func update(id: Int, entity: MovieEntity) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
  
}

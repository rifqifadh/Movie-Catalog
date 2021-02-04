//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 03/02/21.
//

import Foundation
import Combine
import RealmSwift
import Core

protocol LocaleDataSourceProtocol: AnyObject {
  func getFavoriteMovies() -> AnyPublisher<[MovieEntity], Error>
  func addToFavorite(movie: MovieEntity) -> AnyPublisher<Bool, Error>
  func deleteFromFavorite(movie: MovieEntity) -> AnyPublisher<Bool, Error>
  func isFavorite(with id: String) -> AnyPublisher<Bool, Error>
}

public class LocaleDataSourceImpl: LocaleDataSourceProtocol {
	
	private let _realm: Realm?
	public init(realm: Realm?) {
		_realm = realm
	}
	
	public static let sharedInstance: (Realm?) -> LocaleDataSourceImpl = { realmDatabase in
	  return LocaleDataSourceImpl(realm: realmDatabase)
	}
	
	 func getFavoriteMovies() -> AnyPublisher<[MovieEntity], Error> {
		return Future<[MovieEntity], Error> { completion in
			if let realm = self._realm {
			 let movies: Results<MovieEntity> = {
				realm.objects(MovieEntity.self)
				  .sorted(byKeyPath: "id", ascending: true)
			 }()
			 completion(.success(movies.toArray(ofType: MovieEntity.self)))
		  } else {
			 completion(.failure(DatabaseError.invalidInstance))
		  }
		}.eraseToAnyPublisher()
	}
	
	 func addToFavorite(movie: MovieEntity) -> AnyPublisher<Bool, Error> {
		return Future<Bool, Error> { completion in
			if let realm = self._realm {
			 do {
				try realm.write {
				  realm.add(movie, update: .modified)
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
	
	 func deleteFromFavorite(movie: MovieEntity) -> AnyPublisher<Bool, Error> {
		return Future<Bool, Error> { completion in
		  if let realm = self._realm {
			 do {
				let movieEntity = realm.objects(MovieEntity.self).filter("id == \(movie.id)")
				try realm.write {
				  realm.delete(movieEntity)
				}
				completion(.success(true))
			 } catch {
				completion(.failure(DatabaseError.requestFailed))
			 }
		  } else {
			 completion(.failure(DatabaseError.invalidInstance))
		  }
		}.eraseToAnyPublisher()
	}
	
	 func isFavorite(with id: String) -> AnyPublisher<Bool, Error> {
		return Future<Bool, Error> { completion in
		  if let realm = self._realm {
			 let movies = realm.objects(MovieEntity.self).filter("id == \(id)")
			 if !movies.isEmpty {
				completion(.success(true))
			 }
		  } else {
			 completion(.failure(DatabaseError.invalidInstance))
		  }
		}.eraseToAnyPublisher()
	}
}

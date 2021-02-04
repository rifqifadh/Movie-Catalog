//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/12/20.
//

import Foundation
import RealmSwift

public class MovieEntity: Object {
	
	@objc dynamic var id: Int = 0
	@objc dynamic var title: String = ""
	@objc dynamic var overview: String = ""
	@objc dynamic var voteAverage: Double = 0
	@objc dynamic var posterPath: String = ""
	@objc dynamic var backdropPath: String = ""
	@objc dynamic var releaseDate: String = ""
	
	public override class func primaryKey() -> String? {
		return "id"
	}
	
}

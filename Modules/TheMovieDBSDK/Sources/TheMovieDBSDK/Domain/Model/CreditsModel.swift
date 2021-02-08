//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import Foundation
import Core

public struct CreditsModel: Decodable {
	public let id: Int
	public let cast: [CastModel]
}

public struct CastModel: Decodable, Identifiable {
	public let id: Int
	public let name: String
	public let character: String
	public let profilePath: String
	public var profile: String {
		Constants.TMDBEnv.imageUrl(size: "w500") + profilePath
	}
}

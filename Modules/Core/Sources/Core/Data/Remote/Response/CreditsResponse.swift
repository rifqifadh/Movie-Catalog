//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import Foundation

public struct CreditsResponse: Codable {
	let id: Int
	let cast: [CastResponse]
}

public struct CastResponse: Codable {
	let id: Int
	let name: String
	let character: String
	let profilePath: String?
}

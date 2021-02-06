//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import Foundation

struct CreditsResponse: Decodable {
	let id: Int
	let cast: [CastResponse]
}

struct CastResponse: Decodable {
	let id: Int
	let name: String
	let character: String
}

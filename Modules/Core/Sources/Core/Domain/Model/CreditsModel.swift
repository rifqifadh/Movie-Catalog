//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import Foundation

public struct CreditsModel: Decodable {
	let id: Int
	let cast: [CastModel]
}

struct CastModel: Decodable {
	let id: Int
	let name: String
	let character: String
}

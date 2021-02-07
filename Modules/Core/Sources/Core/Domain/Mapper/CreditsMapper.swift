//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 07/02/21.
//

import Foundation

struct CreditsMapper {
	
	static func transformResponseToDomain(response: CreditsResponse) -> CreditsModel {
		return CreditsModel(
			id: response.id,
			cast: response.cast.map { cast in
				CastModel(id: cast.id, name: cast.name, character: cast.character, profilePath: cast.profilePath ?? "")
			})
	}
}

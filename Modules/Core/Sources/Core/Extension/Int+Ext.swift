//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 02/02/21.
//

import Foundation

extension Int {
	public func minutesToHoursMinute() -> String {
		let hours = self / 60
		let minutes = self % 60
		
		return "\(hours)h \(minutes)m"
	}
}

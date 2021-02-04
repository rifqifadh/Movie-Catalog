//
//  File.swift
//  
//
//  Created by Rifqi Fadhlillah on 08/12/20.
//

import Foundation
import SwiftUI

extension String {
  public func toDate(withFormat format: String = "yyyy-MM-dd") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Take a look to your format")
    }
    return date
  }
}

extension String.StringInterpolation {
	
}

public protocol Formattable {
	mutating func appendInterpolation(_: String)
	mutating func appendInterpolation(_ values: [String], empty defaultValue: @autoclosure () -> String)
}

extension Formattable {
	/// Convert from seconds to hour, minute
	public mutating func appendInterpolation(_ value: Double, style: DateComponentsFormatter.UnitsStyle) {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = style
		formatter.allowedUnits = [.hour, .minute]
		
		if let outputString = formatter.string(from: value) {
			appendInterpolation(outputString)
		}
	 }
	
	/// Convert Array of string to string joined
	public mutating func appendInterpolation(_ values: [String], empty defaultValue: @autoclosure () -> String) {
		if values.count == 0 {
			appendInterpolation(defaultValue())
		} else {
			appendInterpolation(values.joined(separator: ", "))
		}
	}
}

extension LocalizedStringKey.StringInterpolation: Formattable {}
extension String.StringInterpolation: Formattable {}

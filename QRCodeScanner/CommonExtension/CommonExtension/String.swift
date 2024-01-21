//
//  String.swift
//  CommonExtension
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import Foundation

public extension String {
	/// Easily convert string to double
	func toDouble() -> Double {
		return Double(self) ?? 0
	}
}

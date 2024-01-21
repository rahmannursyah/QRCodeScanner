//
//  TransactionDetailUIModel.swift
//  Domain
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import Foundation

public struct TransactionDetailUIModel: Codable {
	public let bank: String
	public let id: String
	public let merchant: String
	public let nominal: String
	
	public init(bank: String, id: String, merchant: String, nominal: String) {
		self.bank = bank
		self.id = id
		self.merchant = merchant
		self.nominal = nominal
	}
}

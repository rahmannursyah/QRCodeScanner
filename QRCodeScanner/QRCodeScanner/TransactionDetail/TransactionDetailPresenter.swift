//
//  TransactionDetailPresenter.swift
//  QRCodeScanner
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import Domain
import Foundation

class TransactionDetailPresenter: TransactionDetailViewToPresenter {
    weak var view: TransactionDetailPresenterToView?
    var interactor: TransactionDetailPresenterToInteractor?
    var router: TransactionDetailPresenterToRouter?
	var transactionDetailData: Domain.TransactionDetailUIModel
	
	init(transactionDetailData: TransactionDetailUIModel) {
		self.transactionDetailData = transactionDetailData
	}
	
	
}

extension TransactionDetailPresenter: TransactionDetailInteractorToPresenter {
    
}

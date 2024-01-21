// 
//  TransactionDetailContract.swift
//  QRCodeScanner
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import Domain
import UIKit

// MARK: View -
protocol TransactionDetailPresenterToView: AnyObject {
    var presenter: TransactionDetailViewToPresenter? { get set }
}

// MARK: Interactor -
protocol TransactionDetailPresenterToInteractor: AnyObject {
    var presenter: TransactionDetailInteractorToPresenter? { get set }
}

// MARK: Router -
protocol TransactionDetailPresenterToRouter: AnyObject {
	func createTransactionDetailModule(detailData: TransactionDetailUIModel) -> UIViewController
}

// MARK: Presenter -
protocol TransactionDetailViewToPresenter: AnyObject {
    var view: TransactionDetailPresenterToView? { get set }
    var interactor: TransactionDetailPresenterToInteractor? { get set }
    var router: TransactionDetailPresenterToRouter? { get set }
	var transactionDetailData: TransactionDetailUIModel { get set }
}

protocol TransactionDetailInteractorToPresenter: AnyObject {
}

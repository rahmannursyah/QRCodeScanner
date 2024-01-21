// 
//  QRScannerContract.swift
//  QRCodeScanner
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import Domain
import UIKit

// MARK: View -
protocol QRScannerPresenterToView: AnyObject {
    var presenter: QRScannerViewToPresenter? { get set }
}

// MARK: Interactor -
protocol QRScannerPresenterToInteractor: AnyObject {
    var presenter: QRScannerInteractorToPresenter? { get set }
}

// MARK: Router -
protocol QRScannerPresenterToRouter: AnyObject {
	var transactionDetailRouter: TransactionDetailPresenterToRouter? { get set }
	
	func createQRScannerModule() -> UIViewController
	func routeToTransactionDetail(data: TransactionDetailUIModel, navigationController: UINavigationController?)
}

// MARK: Presenter -
protocol QRScannerViewToPresenter: AnyObject {
    var view: QRScannerPresenterToView? { get set }
    var interactor: QRScannerPresenterToInteractor? { get set }
    var router: QRScannerPresenterToRouter? { get set }
	
	func showQRisDetail(data: TransactionDetailUIModel, navigationController: UINavigationController?)
}

protocol QRScannerInteractorToPresenter: AnyObject {
}

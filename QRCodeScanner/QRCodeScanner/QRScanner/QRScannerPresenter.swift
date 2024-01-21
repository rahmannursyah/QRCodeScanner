//
//  QRScannerPresenter.swift
//  QRCodeScanner
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import Domain
import Foundation
import UIKit

class QRScannerPresenter: QRScannerViewToPresenter {
    weak var view: QRScannerPresenterToView?
    var interactor: QRScannerPresenterToInteractor?
    var router: QRScannerPresenterToRouter?
	
	func showQRisDetail(data: TransactionDetailUIModel, navigationController: UINavigationController?) {
		router?.routeToTransactionDetail(data: data, navigationController: navigationController)
	}
}

extension QRScannerPresenter: QRScannerInteractorToPresenter {
    
}

// 
//  QRScannerRouter.swift
//  QRCodeScanner
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import Component
import Domain
import UIKit

class QRScannerRouter: QRScannerPresenterToRouter {
	var transactionDetailRouter: TransactionDetailPresenterToRouter?
	
     public func createQRScannerModule() -> UIViewController {
         let view: UIViewController & QRScannerPresenterToView = QRScannerVC()
         let presenter: QRScannerViewToPresenter & QRScannerInteractorToPresenter = QRScannerPresenter()
         let interactor: QRScannerPresenterToInteractor = QRScannerInteractor()
         let router: QRScannerPresenterToRouter = QRScannerRouter()
        
         view.presenter = presenter
         presenter.view = view
         presenter.router = router
         presenter.interactor = interactor
         interactor.presenter = presenter
		 router.transactionDetailRouter = DIContainer.shared.resolve(type: TransactionDetailPresenterToRouter.self)
        
         return view
     }
	
	func routeToTransactionDetail(data: TransactionDetailUIModel, navigationController: UINavigationController?) {
		let transactionDetailVC = transactionDetailRouter?.createTransactionDetailModule(detailData: data)
		guard let transactionDetailVC = transactionDetailVC else { return }
		navigationController?.pushViewController(transactionDetailVC, animated: true)
	}
}

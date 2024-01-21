// 
//  TransactionDetailRouter.swift
//  QRCodeScanner
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import Domain
import UIKit

class TransactionDetailRouter: TransactionDetailPresenterToRouter {
     public func createTransactionDetailModule(detailData: TransactionDetailUIModel) -> UIViewController {
         let view: UIViewController & TransactionDetailPresenterToView = TransactionDetailView()
		 let presenter: TransactionDetailViewToPresenter & TransactionDetailInteractorToPresenter = TransactionDetailPresenter(transactionDetailData: detailData)
         let interactor: TransactionDetailPresenterToInteractor = TransactionDetailInteractor()
         let router: TransactionDetailPresenterToRouter = TransactionDetailRouter()
        
         view.presenter = presenter
         presenter.view = view
         presenter.router = router
         presenter.interactor = interactor
         interactor.presenter = presenter
        
         return view
     }
}

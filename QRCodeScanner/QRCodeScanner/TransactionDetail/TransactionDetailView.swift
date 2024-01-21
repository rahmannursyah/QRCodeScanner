//
//  TransactionDetailView.swift
//  QRCodeScanner
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import UIKit

class TransactionDetailView: UIViewController, TransactionDetailPresenterToView {
    var presenter: TransactionDetailViewToPresenter?
	lazy var paymentLbl: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		lbl.textColor = .black
		return lbl
	}()
	
	lazy var merchantLbl: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		lbl.textColor = .black
		return lbl
	}()
	
	lazy var nominalLbl: UILabel = {
		let lbl = UILabel()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		lbl.textColor = .black
		return lbl
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setupView()
		setupConstraints()
    }
	
	private func setupView() {
		view.backgroundColor = .white
		self.navigationItem.title = "Pembayaran"
		paymentLbl.text = "Pembayaran Berhasil"
		merchantLbl.text = presenter?.transactionDetailData.merchant
		nominalLbl.text = presenter?.transactionDetailData.nominal.toDouble().formatted()
		
		view.addSubview(paymentLbl)
		view.addSubview(merchantLbl)
		view.addSubview(nominalLbl)
	}
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			paymentLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			paymentLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			paymentLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
			paymentLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			merchantLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
			merchantLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
			merchantLbl.topAnchor.constraint(equalTo: paymentLbl.bottomAnchor, constant: 16),
			
			nominalLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
			nominalLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
			nominalLbl.topAnchor.constraint(equalTo: merchantLbl.bottomAnchor, constant: 16),
		])
	}
}

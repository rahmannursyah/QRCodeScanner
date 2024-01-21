//
//  ViewController.swift
//  CommonExtension
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import UIKit

public extension UIViewController {
	/// Easily show a simple alert message
	func showAlert(title: String, message: String, confirmAction: @escaping () -> Void, cancelAction: @escaping () -> Void) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Pay", style: .default, handler: { action in
			confirmAction()
		}))
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
			cancelAction()
		}))
		
		self.present(alert, animated: true)
	}
}

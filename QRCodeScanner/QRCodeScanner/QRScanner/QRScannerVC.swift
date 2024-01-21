//
//  QRScannerVC.swift
//  QRCodeScanner
//
//  Created by Rahmannur Rizki Syahputra on 21/01/24.
//

import AVFoundation
import CommonExtension
import Domain
import UIKit

class QRScannerVC: UIViewController, QRScannerPresenterToView {
    var presenter: QRScannerViewToPresenter?
	var captureSession: AVCaptureSession!
	var previewLayer: AVCaptureVideoPreviewLayer!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor.black
		captureSession = AVCaptureSession()
		
		guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
		let videoInput: AVCaptureDeviceInput
		
		do {
			videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
		} catch {
			return
		}
		
		if (captureSession.canAddInput(videoInput)) {
			captureSession.addInput(videoInput)
		} else {
			failed()
			return
		}
		
		let metadataOutput = AVCaptureMetadataOutput()
		
		if (captureSession.canAddOutput(metadataOutput)) {
			captureSession.addOutput(metadataOutput)
			
			metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
			metadataOutput.metadataObjectTypes = [.qr]
		} else {
			failed()
			return
		}
		
		previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
		previewLayer.frame = view.layer.bounds
		previewLayer.videoGravity = .resizeAspectFill
		view.layer.addSublayer(previewLayer)
		
		startCaptureSession()
	}
	
	func failed() {
		let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
		captureSession = nil
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if (captureSession?.isRunning == false) {
			startCaptureSession()
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		if (captureSession?.isRunning == true) {
			captureSession.stopRunning()
		}
	}
	
	func found(code: String) {
		let subStringDatas = code.split(separator: ".")
		
		let transactionDetailModel = TransactionDetailUIModel(bank: String(subStringDatas[0]), id: String(subStringDatas[1]), merchant: String(subStringDatas[2]), nominal: String(subStringDatas[3]))
		
		let alertMsg = "Bank: \(transactionDetailModel.bank)\nTransaction ID: \(transactionDetailModel.id)\nMerchant Name: \(transactionDetailModel.merchant)\nNominal: \(transactionDetailModel.nominal.toDouble().formatted())"
		
		self.showAlert(title: "Confirm Transaction?", message: alertMsg) { [weak self] in
			self?.presenter?.showQRisDetail(data: transactionDetailModel, navigationController: self?.navigationController)
		} cancelAction: { [weak self] in
			self?.startCaptureSession()
		}
		
	}
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return .portrait
	}
	
	private func startCaptureSession() {
		DispatchQueue.global(qos: .background).async { [weak self] in
			self?.captureSession.startRunning()
		}
	}
}

extension QRScannerVC: AVCaptureMetadataOutputObjectsDelegate {
	func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
		captureSession.stopRunning()
		
		if let metadataObject = metadataObjects.first {
			guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
			guard let stringValue = readableObject.stringValue else { return }
			AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
			found(code: stringValue)
		}
		
//		dismiss(animated: true)
	}
}

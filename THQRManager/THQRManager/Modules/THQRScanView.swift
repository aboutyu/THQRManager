//
//  THQRScanView.swift
//  THQRManager
//
//  Created by TAEHUN YU on 2020/08/11.
//  Copyright © 2020 TAEHUN YU. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

// THQRScanView Delegate
public protocol THQRScanViewDelegate {
    func reccivedQRImage(string: String?)
    func failScanQRImage(string: String?)
}

public class THQRScanView: UIView, AVCaptureMetadataOutputObjectsDelegate {
    
    public var delegate: THQRScanViewDelegate?
    
    private var captureSession: AVCaptureSession!
    private var previewLayer: AVCaptureVideoPreviewLayer!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            fail()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            fail()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.isHidden = true
        
        self.layer.addSublayer(previewLayer)
    }
    
    public func startCapture() {
        captureSession.startRunning()
        previewLayer.isHidden = false
    }
    
    public func stopCapture() {
        captureSession.stopRunning()
        previewLayer.isHidden = true
    }
    
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else {
                fail(string: "데이터를 읽을 수 없습니다.")
                return
            }
            
            guard let stringValue = readableObject.stringValue else {
                fail(string: "데이터가 없습니다.")
                return
            }
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            self.delegate?.reccivedQRImage(string: stringValue)
        } else {
            fail(string: "올바르지 않은 데이터입니다.")
        }
    }
    
    private func fail(string: String? = nil) {
        delegate?.failScanQRImage(string: string)
    }
}

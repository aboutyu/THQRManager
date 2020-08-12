//
//  THQRScanViewController.swift
//  THQRManager
//
//  Created by TAEHUN YU on 2020/08/12.
//  Copyright © 2020 TAEHUN YU. All rights reserved.
//

import UIKit

class THQRScanViewController: UIViewController, THQRScanViewDelegate {
    
    @IBOutlet weak var thQRScanView: THQRScanView!
    
    @IBAction func touchStop(_ sender: UIBarButtonItem) {
        thQRScanView.stopCapture()
    }
    
    @IBAction func touchStart(_ sender: UIBarButtonItem) {
        thQRScanView.startCapture()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thQRScanView.delegate = self
    }
    
    func reccivedQRImage(string: String?) {
        let alert = UIAlertController(title: "성공", message: string, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func failScanQRImage(string: String?) {
        
        let alert = UIAlertController(title: "실패", message: string, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}

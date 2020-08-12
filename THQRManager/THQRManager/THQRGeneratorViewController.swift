//
//  THQRGeneratorViewController.swift
//  THQRManager
//
//  Created by TAEHUN YU on 2020/08/12.
//  Copyright © 2020 TAEHUN YU. All rights reserved.
//

import UIKit

class THQRGeneratorViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func touchInit(_ sender: UIBarButtonItem) {
        generateText = nil
        resultQRImage = nil
        
        runQR()
    }
    
    @IBAction func touchGenerate(_ sender: UIBarButtonItem) {
    
        guard let txt = textField.text else {
            return
        }
        
        guard let img = txt.thQRGenerator(scaleX: 100.0, scaleY: 100.0) else {
            return
        }
        
        generateText = txt
        resultQRImage = img
        runQR()
    }
    
    var generateText: String?
    var resultQRImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func runQR() {
        textField.resignFirstResponder()
        textField.text = generateText
        imgView.image = resultQRImage
    }
}

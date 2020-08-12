//
//  THQRGenerator.swift
//  THQRManager
//
//  Created by TAEHUN YU on 2020/08/11.
//  Copyright © 2020 TAEHUN YU. All rights reserved.
//
import UIKit

extension String {
    
    public func thQRGenerator() -> UIImage? {
        
        guard let data = self.data(using: .ascii), let filter = CIFilter(name: "CIQRCodeGenerator") else {
                return nil
            }
            
            filter.setValue(data, forKey: "inputMessage")
            
            guard let img = filter.outputImage else {
                return nil
            }
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let image = img.transformed(by: transform)
        
            return UIImage(ciImage: image)
    }
}

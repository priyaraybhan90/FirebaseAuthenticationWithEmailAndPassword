//
//  CustomButton.swift
//  FirebaseAuthentication
//
//  Created by Admin on 09/03/22.
//

import Foundation
import UIKit

extension UIButton  {
    
    func customiseButtons(title: String)
    {
        self.backgroundColor = UIColor(red: 0/255.0, green: 151.0/255.0, blue: 236.0/255.0, alpha: 1.0)
        self.layer.cornerRadius = 5
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
    }
}

//
//  AuthenticationExtension.swift
//  FirebaseAuthentication
//
//  Created by Admin on 08/03/22.
//

import Foundation
import UIKit
import Firebase

extension FirebasAuthenticationController
{
    func setTitle()
    {
        switch authenticationType {
        case .signUp:
            self.title = "Sign Up"
            btnSignIn.setTitle("Sign Up", for: .normal)
        case .signIn:
            self.title = "Sign In"
            btnSignIn.setTitle("Sign In", for: .normal)
        default:
            self.title = "Sign In"
        }
        
        btnSignIn.customiseButtons(title: self.title ?? "Sign In")

    }
    
    // MARK : UITextFieldDelegate
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  //delegate method
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK : FirebaseAuthManagerDelegate
    
    func logoutStatus(status: Bool?, message: String?)
    {
    }
    
    func showErrorAlert(message: String?) {
        
        isSignInClicked = false
        let alert = UIAlertController(title: "Firebase Authentication", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            
                if message == StringValues.kSignUpSuccess || message == StringValues.kSignInSuccess
                {
                    self.navigationController?.popViewController(animated: true)
                    self.dismiss(animated: true) {
                        self.showErrorAlert(message: message)
                    }
                }
            
        }))
        

        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    

    
    func signInSuccessWithInfo(userInfo: UserInfo?, message: String) {
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true) {
            self.showErrorAlert(message: message)
        }
    }
}

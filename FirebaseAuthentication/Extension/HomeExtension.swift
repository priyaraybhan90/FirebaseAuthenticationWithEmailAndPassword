//
//  HomeExtension.swift
//  FirebaseAuthentication
//
//  Created by Admin on 08/03/22.
//

import Foundation
import UIKit
import Firebase

enum authenticationType
{
    case signIn
    case signUp
}

extension HomeViewController
{
    func updateGUI()
    {
        btnLogout.customiseButtons(title: "Logout")
        btnSignIn.customiseButtons(title: "Sign In")
        btnSignUp.customiseButtons(title: "Sign Up")
    }
    
    func moveToAuthenticate(type: authenticationType)
    {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FirebasAuthenticationController") as? FirebasAuthenticationController
        vc?.authenticationType = type
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    // MARK : FirebaseAuthManagerDelegate
    
    func logoutStatus(status: Bool?, message: String?)
    {
        showErrorAlert(message: message)
        setButtonEnable(status: status ?? true)
    }
    
    func showErrorAlert(message: String?) {
        let alert = UIAlertController(title: "Firebase Authentication", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}



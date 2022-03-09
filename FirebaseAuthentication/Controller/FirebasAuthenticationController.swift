//
//  ViewController.swift
//  FirebaseAuthentication
//
//  Created by Admin on 08/03/22.
//

import UIKit

class FirebasAuthenticationController: UIViewController, UITextFieldDelegate, FirebaseAuthManagerDelegate {
    
    @IBOutlet weak var txtEmail: UITextField?
    @IBOutlet weak var txtPassword: UITextField?
    @IBOutlet weak var btnSignIn: UIButton!
    
    var isSignInClicked: Bool = false
    
    var authenticationType: authenticationType!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        txtEmail?.delegate = self
        txtPassword?.delegate = self
        FirebaseAuthManager.shared.delegate = self
    }
    
    @IBAction func btnSignInClicked(_ sender: Any) {
        if !isSignInClicked
         {
            isSignInClicked = true
            switch authenticationType {
         case .signIn:
             FirebaseAuthManager.shared.signInWithEmailAndPassword(emailId: txtEmail?.text ?? "", password: txtPassword?.text ?? "")
                break
         case .signUp:
             FirebaseAuthManager.shared.signUpWithEmailAndPassword(emailId: txtEmail?.text ?? "", password: txtPassword?.text ?? "")
                break
         default:
             print("")
                break

         }
        }
     }
    
    
}


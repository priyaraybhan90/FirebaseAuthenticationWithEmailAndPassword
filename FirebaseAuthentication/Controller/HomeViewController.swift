//
//  HomeViewController.swift
//  FirebaseAuthentication
//
//  Created by Admin on 08/03/22.
//

import Foundation
import UIKit
import Firebase
class HomeViewController: UIViewController,FirebaseAuthManagerDelegate {

    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var lblEmail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateGUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FirebaseAuthManager.shared.delegate = self

        setButtonEnable(status: !FirebaseAuthManager.shared.isUserLoggedIn())
        if FirebaseAuthManager.shared.isUserLoggedIn() {
            let userInfo = Auth.auth().currentUser
            lblEmail.text = String("Email Id : \(userInfo?.email ?? "" )")
        }
    }
    
    func setButtonEnable(status: Bool){
        btnSignIn.isHidden = !status
        btnSignUp.isHidden = !status
        btnLogout.isHidden = status
        lblEmail.isHidden = status
    }
    
    @IBAction func buttonSignInPressed(_ sender: Any) {
        moveToAuthenticate(type: authenticationType.signIn)
    }
    
    @IBAction func buttonSignUpPressed(_ sender: Any) {
        moveToAuthenticate(type: authenticationType.signUp)
    }
    
    @IBAction func buttonLogoutPressed(_ sender: Any) {
        FirebaseAuthManager.shared.logout()
    }
    
}

//
//  FirebaseAuthManager.swift
//  FirebaseAuthentication
//
//  Created by Admin on 08/03/22.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

protocol FirebaseAuthManagerDelegate
{
    func logoutStatus(status: Bool?, message: String?)
    func showErrorAlert(message: String?)
}

class FirebaseAuthManager
{
    
    static let shared = FirebaseAuthManager()
    var delegate : FirebaseAuthManagerDelegate?

    private init() {
        
    }
    
    func isUserLoggedIn() -> Bool {
      return Auth.auth().currentUser != nil
    }
    
    func getUserInfo()
    {
        
    }
    
    func logout(){
        do {
          try Auth.auth().signOut()
            self.delegate?.logoutStatus(status: true, message: StringValues.kLogout)
        } catch {
            self.delegate?.logoutStatus(status: false, message: "Sign out error : " + error.localizedDescription)
        }
    }
    
    func signInWithEmailAndPassword(emailId: String, password: String){
        
        
        if !Validation.init().isValidEmail(emailId)
         {
            self.delegate?.showErrorAlert(message: StringValues.kValidEmail)
            return
        }
  
        
        if !Validation.init().isValidPassword(password)
         {
            self.delegate?.showErrorAlert(message: StringValues.kValidPassword)
            return
        }

        
        Auth.auth().signIn(withEmail: emailId, password: password) { (authResult, error) in
            if let error = error as NSError? {
                self.delegate?.showErrorAlert(message: error.localizedDescription)
              
          } else {
              self.delegate?.showErrorAlert(message: StringValues.kSignInSuccess)
            let userInfo = Auth.auth().currentUser
//              self.delegate?.signInSuccessWithInfo(userInfo: userInfo)
          }
        }
    }
    
    func signUpWithEmailAndPassword(emailId: String, password: String){
        
        if !Validation.init().isValidEmail(emailId)
         {
            self.delegate?.showErrorAlert(message: StringValues.kValidEmail)
            return
        }
        
       if !Validation.init().isValidPassword(password)
        {
           self.delegate?.showErrorAlert(message: StringValues.kValidPassword)
           return
       }
            
        Auth.auth().createUser(withEmail: emailId, password: password) { authResult, error in
            if let error = error as NSError? {
                self.delegate?.showErrorAlert(message: error.localizedDescription)
          } else {
              self.delegate?.showErrorAlert(message: StringValues.kSignUpSuccess)
            let newUserInfo = Auth.auth().currentUser
            let email = newUserInfo?.email
              print(email ?? "")
          }
        }
    }
   
    

}

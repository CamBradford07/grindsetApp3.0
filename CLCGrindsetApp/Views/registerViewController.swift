//
//  registerViewController.swift
//  CLCGrindsetApp
//
//  Created by DANIEL HUSEBY on 5/15/25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import CryptoKit
import AuthenticationServices
import GoogleSignIn

class registerViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailTextOutlet: UITextField!
    @IBOutlet weak var passwordFieldOutlet: UITextField!
    
    fileprivate var currentNonce: String?
    
var alreadyLoggedIn = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func emailLoginAction(_ sender: Any) {
        if alreadyLoggedIn {
            return
        }
        
        let email = emailTextOutlet.text ?? ""
        let password = passwordFieldOutlet.text ?? ""
        
        if email == "" || password == ""{
            createAlert(alertTitle: "Invalid Input", alertDesc: "Email and Password cannot be blank")
        }
        else{
            var userFound = false
            
            for id in AppData.ids{
                if id.lowercased() == email.lowercased(){
                    userFound = true
                    break
                }
            }
//            print(userFound)
            
            if userFound == true{
                createAlert(alertTitle: "Email already registered", alertDesc: "Email has already been created")
            } else {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
//                        print("User creation failed: \(error.localizedDescription)")
                        self.createAlert(alertTitle: "Account Creation Failed", alertDesc: error.localizedDescription)
                        return
                    }

//                    print("User Creation Successful for \(email)")

                    // Now safe to continue
                    let newStudent = Student(id: email, gradeLevel: 9, selectedClasses: [String](), takenClasses: [String]())
                    newStudent.addToFirebase(docRef: AppData.ref)
                    AppData.currentStudent = newStudent
                    AppData.saveUserAndPass()
                    AppData.loadSelectedClasses()
                    self.alreadyLoggedIn = true
                    self.performSegue(withIdentifier: "registerSuccess", sender: self)
                } // chat fixed error finding
            }
            
            
        }
    }
    
    func createAlert(alertTitle: String, alertDesc: String){
            let alert = UIAlertController(title: alertTitle, message: alertDesc, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

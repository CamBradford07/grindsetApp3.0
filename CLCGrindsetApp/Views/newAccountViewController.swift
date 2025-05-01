//
//  newAccountViewController.swift
//  CLCGrindsetApp
//
//  Created by DANIEL HUSEBY on 4/23/25.
//

import UIKit

class newAccountViewController: UIViewController, UITextFieldDelegate {
    
    static var createdNew = false

    
    @IBOutlet weak var userNameOutlet: UITextField!
    
    
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    
    @IBOutlet weak var ageOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameOutlet.delegate = self
        passwordOutlet.delegate = self
        nameOutlet.delegate = self
        ageOutlet.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapAction(_ sender: Any) {
        userNameOutlet.resignFirstResponder()
        passwordOutlet.resignFirstResponder()
        ageOutlet.resignFirstResponder()
        nameOutlet.resignFirstResponder()
    }
    
    @IBAction func createAction(_ sender: Any) {
        let username = userNameOutlet.text!
        if username.count < 5{
            createAlert(alertTitle: "Username not valid", alertDesc: "Username must be at least 5 characters long")
            return
        }
        
        let password = passwordOutlet.text!
        if password.count < 5{
            createAlert(alertTitle: "Password not valid", alertDesc: "Password must be at least 5 characters long")
            return
        }
        
        let age = ageOutlet.text!
        let name = nameOutlet.text!
        var userFound = false
        for usernameHi in AppData.usernames{
            if username.lowercased() == usernameHi.lowercased(){
                userFound = true
                break
            }
        }
        
        if (!userFound){
            var accountAge = -1
            if let age = Int(ageOutlet.text!){
                accountAge = age
            }else{
                createAlert(alertTitle: "Age not found", alertDesc: "Age is not an integer")
                return
            }
            if accountAge <= 0{
                createAlert(alertTitle: "Age not valid", alertDesc: "Enter a valid age")
                return
            }
            var accountName = nameOutlet.text!
            var newStudent = Student(username: username, password: password, gradeLevel: 0, selectedClasses: [String](), name: accountName, age: accountAge, takenClasses: [String]())
            newStudent.addToFirebase(docRef: AppData.ref)
            AppData.currentStudent = newStudent
            AppData.saveUserAndPass()
            
            newAccountViewController.createdNew = true
            self.navigationController?.popViewController(animated: false)
            
            
        }else{
            createAlert(alertTitle: "Error", alertDesc: "Username already exists.")
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

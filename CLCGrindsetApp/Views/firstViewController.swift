//
//  firstViewController.swift
//  CLCGrindsetApp
//
//  Created by DANIEL HUSEBY on 4/24/25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class firstViewController: UIViewController {
    
//    var students = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // this code will check if the account already exists. should probably reorganize students into AppData, but i dont have enough time to make that work
       
        AppData.ref = Firestore.firestore().collection("data").document("Accounts")
        
        AppData.ref.addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                  print("Error fetching document: \(error!)")
                  return
                }
                guard let data = document.data() else {
                  print("Document data was empty.")
                  return
                }
            
            AppData.usernames.removeAll()
            AppData.passwords.removeAll()
            AppData.students.removeAll()
            
            for key in data.keys{
                    let dataArray = data[key] as! [String : Any]
                    let uncodedAccount = Student(dict: dataArray)
                AppData.students.append(uncodedAccount)
                AppData.usernames.append(uncodedAccount.username)
                AppData.passwords.append(uncodedAccount.password)
            }
            
            
              }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func lockInAction(_ sender: Any) {
        //
        let enteredUsername = UserDefaults.standard.string(forKey: "username") ?? ""
        let enteredPassword = UserDefaults.standard.string(forKey: "password") ?? ""
        
        var userFound = false
        var userIndex = -1
        for username in AppData.usernames{
            if enteredUsername.lowercased() == username.lowercased(){
                userFound = true
                userIndex = AppData.usernames.firstIndex(of: username) ?? -1
                break
            }
        }
        
        if userFound && userIndex != -1{
            if enteredPassword == AppData.passwords[userIndex]{
                AppData.currentStudent = AppData.students[userIndex]
                performSegue(withIdentifier: "skipLogin", sender: self)
            }else{
                performSegue(withIdentifier: "toLogin", sender: self)
            }
        }else{
            performSegue(withIdentifier: "toLogin", sender: self)
        }
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

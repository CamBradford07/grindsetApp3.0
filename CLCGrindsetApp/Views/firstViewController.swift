//
//  firstViewController.swift
//  CLCGrindsetApp
//
//  Created by DANIEL HUSEBY on 4/24/25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
//fire :)

class firstViewController: UIViewController {
    
    static var justRegistered = false

//    var students = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this code will check if the account already exists. should probably reorganize students into AppData, but i dont have enough time to make that work
        loadCoursesFromCSV()
        AppData.ref = Firestore.firestore().collection("data").document("Accounts")
        
        AppData.ref.addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
//                  print("Error fetching document: \(error!)")
                  return
                }
                guard let data = document.data() else {
//                  print("Document data was empty.")
                  return
                }
            
            AppData.ids.removeAll()
            AppData.students.removeAll()
            
            for key in data.keys{
                AppData.ids.append(key)
                    let dataArray = data[key] as! [String : Any]
                    let uncodedAccount = Student(dict: dataArray)
                AppData.students.append(uncodedAccount)
                
            }
            
            
              }

//        AppData.rankRef.addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                  print("Error fetching document: \(error!)")
//                  return
//                }
//                guard let data = document.data() else {
//                  print("Document data was empty.")
//                  return
//                }
//            
//            
//            // we are going to overhaul this to save the ranks instead.
//            // it should work... right???
//            // first remove all the things in the allRanks array
//            
//            
////            AppData.ids.removeAll()
////            AppData.students.removeAll()
//            
//            for key in data.keys{
//                AppData.ids.append(key)
//                    let dataArray = data[key] as! [String : Any]
//                    let uncodedAccount = Student(dict: dataArray)
//                AppData.students.append(uncodedAccount)
//                
//            }
//            
//            
//              }

        
        
        // Do any additional setup after loading the view.
    }
    
    //you gotta lock in
    @IBAction func lockInAction(_ sender: Any) {
        //
        let enteredID = UserDefaults.standard.string(forKey: "ID") ?? ""
        
        
        var userFound = false
        var userIndex = -1
        for id in AppData.ids{
            if enteredID.lowercased() == id.lowercased(){
                userFound = true
                userIndex = AppData.ids.firstIndex(of: id) ?? -1
                break
            }
        }
        
        if userFound && userIndex != -1{
                AppData.currentStudent = AppData.students[userIndex]
                AppData.loadSelectedClasses()
            if AppData.currentStudent.isStudent{
                performSegue(withIdentifier: "skipLoginStudent", sender: self)
            } else {
                performSegue(withIdentifier: "skipLoginTeacher", sender: self)

            }
            }else{
                performSegue(withIdentifier: "toLogin", sender: self)
            }
    }

}

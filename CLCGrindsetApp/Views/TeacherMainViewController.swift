//  TeacherMainViewController.swift
//  CLCGrindsetApp
//
//  Created by AVA SCHMIDT on 4/24/25.


import UIKit

class TeacherMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        AppData.currentStudent = Student(dict: ["": ""])
        AppData.saveUserAndPass()
        if firstViewController.justRegistered{
            performSegue(withIdentifier: "logout", sender: nil)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
        } else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
   
}

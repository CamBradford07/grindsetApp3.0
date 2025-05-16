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
        if LogoutViewController.justRegistered{
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: true)
        } else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
   
}

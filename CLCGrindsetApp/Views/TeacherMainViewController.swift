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
        if let viewControllers = self.navigationController?.viewControllers, viewControllers.count >= 3 {
            self.navigationController?.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
        }    }
    
   
}

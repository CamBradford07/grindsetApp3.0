//
//  StudentMenuViewController.swift
//  CLCGrindsetApp
//
//  Created by EVANGELINE NOFTZ on 4/17/25.
//

import UIKit

class StudentMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        classesTaken = allCourses
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

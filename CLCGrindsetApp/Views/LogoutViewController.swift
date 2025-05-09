//
//  LogoutViewController.swift
//  CLCGrindsetApp
//
//  Created by MATTHEW FITCH on 4/28/25.
//

import UIKit

class LogoutViewController: UIViewController {
    @IBOutlet weak var adminCodeOutlet: UITextField!
    
    @IBOutlet weak var areYouLabel: UILabel!
    
    var adminCode = "MQL927GH35"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCoursesFromCSV()
        
        areYouLabel.text = "User logged in: \((AppData.currentStudent!).id)\nAre You A..."
        
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func teacherAction(_ sender: UIButton) {
        if adminCodeOutlet.text == adminCode{
            performSegue(withIdentifier: "teacherPasswordSegue", sender: nil)
        }
        else{
            areYouLabel.text = "User logged in: \((AppData.currentStudent!).id)\nSelect Student"
        }
    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        AppData.currentStudent = Student(dict: ["": ""])
        AppData.saveUserAndPass()
        self.navigationController?.popViewController(animated: true)
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

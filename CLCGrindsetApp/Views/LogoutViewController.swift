//
//  LogoutViewController.swift
//  CLCGrindsetApp
//
//  Created by MATTHEW FITCH on 4/28/25.
//

import UIKit

class LogoutViewController: UIViewController {

    @IBOutlet weak var areYouLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCoursesFromCSV()
        
        areYouLabel.text = "User logged in: \((AppData.currentStudent!).id)\nAre You A..."
        
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
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

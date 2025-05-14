//
//  LogoutViewController.swift
//  CLCGrindsetApp
//
//  Created by MATTHEW FITCH on 4/28/25.
//

import UIKit

class LogoutViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var adminCodeOutlet: UITextField!
    
    @IBOutlet weak var areYouLabel: UILabel!
    
    var adminCode = "MQL927GH35"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCoursesFromCSV()
        
        areYouLabel.text = "User logged in: \((AppData.currentStudent!).id)\nAre You A..."
        
        self.navigationItem.hidesBackButton = true

        adminCodeOutlet.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
//    code that filters emojis
//    for some reason it was filtering numbers too???
//    change text field type to ascii thing ONLY
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("input: '\(string)' \n in array thingy: \(Array(string.unicodeScalars))")
//
//        for scalar in string.unicodeScalars {
//            if scalar.properties.isEmoji {
//                print("i am emogi: \(scalar)")
//                return false
//            }
//        }
//        
//        return true
//    }
    
    @IBAction func teacherAction(_ sender: UIButton) {
        if adminCodeOutlet.text == adminCode{
            performSegue(withIdentifier: "teacherPasswordSegue", sender: nil)
        }
        else{
            let alert = UIAlertController(title: "Login Error", message: "Please Enter The Admin Code", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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

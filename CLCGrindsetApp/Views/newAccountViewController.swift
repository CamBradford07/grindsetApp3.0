//
//  newAccountViewController.swift
//  CLCGrindsetApp
//
//  Created by DANIEL HUSEBY on 4/23/25.
//

import UIKit

class newAccountViewController: UIViewController, UITextFieldDelegate {
    
    static var createdNew = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapAction(_ sender: Any) {
        
    }
    
    @IBAction func createAction(_ sender: Any) {
        
            newAccountViewController.createdNew = true
            self.navigationController?.popViewController(animated: false)
        
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
    


}

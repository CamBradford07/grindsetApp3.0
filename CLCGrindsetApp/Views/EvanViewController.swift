//
//  EvanViewController.swift
//  CLCGrindsetApp
//
//  Created by MATTHEW FITCH on 5/6/25.
//

import UIKit

class EvanViewController: UIViewController {

    @IBOutlet weak var tableViewThing: UITableView!
    
    @IBOutlet weak var evanOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func evanAction(_ sender: Any) {
        if getCourseByID(id: evanOutlet.text!) == nil {
            let alert = UIAlertController(title: "Error", message: "Bad course ID", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(alertAction)
            self.present(alert, animated: true)

        } else {
            AppData.currentStudent.selectedClasses.append(evanOutlet.text!)
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

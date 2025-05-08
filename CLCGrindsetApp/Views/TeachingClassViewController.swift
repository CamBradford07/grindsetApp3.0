//
//  TeachingClassViewController.swift
//  CLCGrindsetApp
//
//  Created by MATTHEW FITCH on 5/5/25.
//

import UIKit

class TeachingClassViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitAction(_ sender: Any) {
        var selectedCourseID = "blegh"
        
        let inputID = idTextField.text!
        for course in allCourses {
            if course.courseID == inputID {
                selectedCourseID = course.courseID
                break
            }
        }
        
         if selectedCourseID == "blegh"
        {
             return
        }
        AppData.currentStudent.selectedClasses.append(selectedCourseID)
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

//
//  RatingViewController.swift
//  CLCGrindsetApp
//
//  Created by MATTHEW FITCH on 4/17/25.
//

import UIKit

class EvanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var textArea: UITextField!
    
    var searchTerm = ""
    
    var conformingCourses = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for course in allCourses {
            if course.term == "Spring Semester"
            {
                continue
            }
            conformingCourses.append(course)
        }

        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
        textArea.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
//    for the wierd text dismissal thing
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        comment out for same reason as in logout view controller
//        for scalar in string.unicodeScalars {
//            if scalar.properties.isEmoji {
//                return false
//            }
//        }
        searchTerm = textArea.text!.lowercased() + string
        
        conformingCourses = [Course]()
        for course in allCourses {
            if course.courseName.lowercased().contains(searchTerm) {
                if course.term == "Spring Semester"
                {
                    continue
                }
                conformingCourses.append(course)
            }
        }
        
        tableViewOutlet.reloadData()
        
        return true
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conformingCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addTeachingClassCell", for: indexPath)
        cell.textLabel?.text = conformingCourses[indexPath.row].courseName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let target = allCourses[indexPath.row].courseID
        if getCourseByID(id: target) == nil {
            let alert = UIAlertController(title: "Error", message: "Something went wrong on our end", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(alertAction)
            self.present(alert, animated: true)

        } else {
            AppData.currentStudent.selectedClasses.append(target)
            let alert = UIAlertController(title: "Class added to your profile!", message: "Success", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            self.navigationController?.popViewController(animated: true)
            
            alert.addAction(alertAction)
            self.present(alert, animated: true)
            
            
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

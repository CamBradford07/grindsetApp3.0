//
//  RatingViewController.swift
//  CLCGrindsetApp
//
//  Created by PETER MICKLE on 4/17/25.
//

import UIKit

class RatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
    

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
//        comment out for same reason in logout view controller
//        for scalar in string.unicodeScalars {
//            if scalar.properties.isEmoji {
//                return false
//            }
//        }
        
        print("replace: \(string == "")")
        
        searchTerm = textArea.text!.lowercased() + string
        if string == ""
        {
            searchTerm.removeLast()
        }
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = conformingCourses[indexPath.row].courseName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.courseToRate = conformingCourses[indexPath.row]
//        AppData.rateIndex = indexPath.row
        performSegue(withIdentifier: "newRateSegue", sender: self)
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

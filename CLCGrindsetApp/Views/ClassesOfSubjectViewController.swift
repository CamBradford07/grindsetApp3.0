//
//  ClassesOfSubjectViewController.swift
//  CLCGrindsetApp
//
//  Created by RYAN STARK on 4/17/25.
//

import UIKit



class ClassesOfSubjectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var currentSubjectClasses: [Course] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        currentSubjectClasses = allCourses.filter { $0.subject == subjectClicked.subject }
        currentSubjectClasses.removeAll { i in
            completedClasses.completedClasses.contains(i)
        } //chat help
        currentSubjectClasses.removeAll { i in
            classClicked.selectedClasses.contains(i)
        }
        currentSubjectClasses.removeAll { course in
            print(course.eligibleGrades)
            let allowedGrades = course.eligibleGrades
                    .split(separator: ",")
                    .compactMap { part -> Int? in
                        let trimmed = part.trimmingCharacters(in: .whitespaces)
                        // Remove "th", "st", "nd", "rd" suffixes
                        let filtered = trimmed
                            .replacingOccurrences(of: "th", with: "")
                            .replacingOccurrences(of: "st", with: "")
                            .replacingOccurrences(of: "nd", with: "")
                            .replacingOccurrences(of: "rd", with: "")
                        
                        return Int(filtered)
                    }
            return !allowedGrades.contains(Int(AppData.currentStudent.gradeLevel))
        }//chat help

        tableView.reloadData()
        
        

                
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentSubjectClasses.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassesCell", for: indexPath) as! ClassCell
        cell.con(name: String(currentSubjectClasses[indexPath.row].courseName), id:"\(currentSubjectClasses[indexPath.row].term)")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        classClicked.cclass = currentSubjectClasses[indexPath.row]
        
        performSegue(withIdentifier: "seeDetails", sender: nil)
//        performSegue(withIdentifier: "backToSchedule", sender: nil)
        print(currentSubjectClasses[indexPath.row].courseName)
        //classClicked.selectedClass = currentSubjectClasses[indexPath.row].courseName
        //AppData.studentSchedule[periodClicked.selectedPeriod - 1] = classClicked.selectedClass
        
    }
}

//
//  ViewController.swift
//  CLCGrindsetApp
//
//  Created by EVANGELINE NOFTZ on 4/15/25.
//

class subjectClicked{
    static var subject: String = ""
}

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var uniqueSubjects: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for i in 0..<courses.count{
//            print(courses[i].courseName)
//        }
        CompletedClassesViewController.noShowButton = false
        tableView.dataSource = self
        tableView.delegate = self
        filteredCourses = allCourses
        uniqueSubjects = Array(Set(allCourses.map{$0.subject})).sorted()
        tableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uniqueSubjects.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectsCell", for: indexPath)
//        cell.textLabel?.text = "\(course.subject) - \(course.courseName)"
        cell.textLabel?.text = "\(uniqueSubjects[indexPath.row])"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        subjectClicked.subject = uniqueSubjects[indexPath.row]
        print("clicked")
        performSegue(withIdentifier: "seeClasses", sender: nil)
    }

//    self.navigationController?.popViewController(animated: true)

}


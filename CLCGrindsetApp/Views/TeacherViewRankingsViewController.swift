//
//  TeacherViewRankingsViewController.swift
//  CLCGrindsetApp
//
//  Created by EVAN MEYER on 5/1/25.
//

import UIKit

class TeacherViewRankingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCoursesFromCSV()

        print("Loaded course names: \(allCourses.map { $0.courseName })")

        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCourses.count  // Display all courses
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherRateCell", for: indexPath)

        let course = allCourses[indexPath.row]
        cell.textLabel?.text = course.courseName
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = allCourses[indexPath.row]
        AppData.teacherCourseClicked = course
        performSegue(withIdentifier: "toRankSpecific", sender: self)
    }
}

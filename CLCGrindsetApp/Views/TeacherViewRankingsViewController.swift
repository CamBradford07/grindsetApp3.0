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
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppData.currentStudent.selectedClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherRateCell", for: indexPath)
        cell.textLabel?.text = getCourseByID(id: AppData.currentStudent.selectedClasses[indexPath.row])?.courseName
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AppData.teacherCourseClicked = getCourseByID(id: AppData.currentStudent.selectedClasses[indexPath.row])
        AppData.teacherIndex = indexPath.row
        performSegue(withIdentifier: "toRankSpecific", sender: self)
        
    }
}

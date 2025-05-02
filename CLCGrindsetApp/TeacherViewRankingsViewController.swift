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
        allCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherRateCell", for: indexPath)
        cell.textLabel?.text = allCourses[indexPath.row].courseName
        return cell
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AppData.teacherCourseClicked = allCourses[indexPath.row]
        performSegue(withIdentifier: "toRankSpecific", sender: self)
        
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

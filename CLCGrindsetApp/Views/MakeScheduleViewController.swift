//  Created by AVA SCHMIDT on 4/17/25.

import UIKit

class periodClicked {
    static var selectedPeriod = 0
}




class MakeScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var makeScheduleTableView: UITableView!
    
    override func viewDidLoad() {
        makeScheduleTableView.dataSource = self
        makeScheduleTableView.delegate = self
        makeScheduleTableView.reloadData()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // use save changes for student class (avoid add to firebase)
        makeScheduleTableView.reloadData()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        classClicked.selectedClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! CreateScheduleCell
        cell.classLabel.text = classClicked.selectedClasses[indexPath.row].courseName
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            classClicked.selectedClasses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let complete = UITableViewRowAction(style: .normal, title: "Complete") { (action, indexPath) in
            var swipedCourse = allCourses.first(where: {$0.courseName.contains(classClicked.selectedClasses[indexPath.row].courseName)})! //chatgpt help
            
            /*static var classes = ["English", "Mathematics", "Science", "Computer Science", "Driver's Education", "Consumer Ed", "PE / Gym", "Social Science", "Elective"]
            
            static var creditReqs = [4.0, 3.0, 2.0, 1.0, 0.5, 0.25, 2.25, 2.0, 4.0]*/
            
            // FIX THIS STUFF -Eva
            var subjectIndex = GradArrays.classes.firstIndex(of: swipedCourse.subject)!
            print(swipedCourse.subject)
            print("subject index \(subjectIndex)")
            print("credits \(swipedCourse.credits)")
            GradArrays.creditReqs[subjectIndex] -= Double(swipedCourse.credits)!
            GradArrays.totalCreditReq -= Double(swipedCourse.credits)!
            
            
            
            
            
            
            completedClasses.completedClasses.append(swipedCourse)
            classClicked.selectedClasses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            }

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // share item at indexPath
            classClicked.selectedClasses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        complete.backgroundColor = UIColor.green
        delete.backgroundColor = UIColor.systemRed
        return [delete,complete]
        
        // now only shows this one and not delete??
    }
    
    
    
    // new copy
    

}

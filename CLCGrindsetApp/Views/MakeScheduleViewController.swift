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
//        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! CreateScheduleCell
//        cell.classLabel.text = classClicked.selectedClasses[indexPath.row].courseName
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassesCell", for: indexPath) as! ClassCell
        cell.con(name: String(classClicked.selectedClasses[indexPath.row].courseName), id:"\(classClicked.selectedClasses[indexPath.row].courseID)")
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
            
            
            // FIX THIS STUFF -Eva
            if let subjectIndex = GradArrays.classes.firstIndex(of: swipedCourse.subject) {
                GradArrays.creditReqs[subjectIndex] -= Double(swipedCourse.credits)!
                GradArrays.totalCreditReq -= Double(swipedCourse.credits)!
                
                GradArrays.creditReqs[subjectIndex] = (GradArrays.creditReqs[subjectIndex] < 0) ? 0 : GradArrays.creditReqs[subjectIndex]
                
                GradArrays.totalCreditReq = (GradArrays.totalCreditReq < 0) ? 0 : GradArrays.totalCreditReq
            }
            
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
    
    
    @IBAction func infoButton(_ sender: Any) {
            print("wtf")
            let alert = UIAlertController(title: "How to", message: "Add classes by clicking on a subject then class in that subject. Most classes will have 2 copies for each semester, fall and spring. If you make a mistake or have completed a class, swipe left to complete or delete the class", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
    }
}

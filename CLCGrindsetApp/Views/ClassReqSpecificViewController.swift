//
//  ClassReqSpecificViewController.swift
//  CLCGrindsetApp
//
//  Created by EVAN MEYER on 4/21/25.
//
import UIKit
class ClassReqSpecificViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sortedClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        var cell = classesTableView.dequeueReusableCell(withIdentifier: "ReqCell")! as! ReqCell
        
        cell.customize(name: sortedClasses[index].courseName, creditText: "\(sortedClasses[index].credits) credits")
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        classClicked.cclass = sortedClasses[indexPath.row]
        //performSegue(withIdentifier: "seeDetails", sender: nil)
       
        
        performSegue(withIdentifier: "reqClassDetails", sender: nil)
    }
    
    let classes = ["English", "Mathematics", "Science", "Computer science", "Drivers Ed", "Consumer Ed", "PE / Gym", "Social Science", "Electives"]
    
    let countAs = [["English"], ["Math"], ["Science"], ["Computer Science"], ["Driver's Education"], ["Family and Consumer Science"], ["Wellness"], ["Social Science"], ["Art", "Music", "World Language", "Business", "Industrial Technology", "Work Program"]]
    @IBOutlet weak var classesTableView: UITableView!
    
    var sortedClasses = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var curCreditType = AppData.reqType
        
        hello: for course in allCourses {
            for specificType in countAs[curCreditType] {
                if course.subject == specificType {
                    sortedClasses.append(course)
                    
                    continue hello
                }
            }
        }
        
        classesTableView.dataSource = self
        classesTableView.delegate = self
        // Do any additional setup after loading the view.
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

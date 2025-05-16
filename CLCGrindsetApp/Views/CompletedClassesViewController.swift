//
//  CompletedClassesViewController.swift
//  CLCGrindsetApp
//
//  Created by RYAN STARK on 5/6/25.
//

import UIKit

class completedClasses{
    static var completedClasses: [Course] = []
}

class CompletedClassesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    static var noShowButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        completedClasses.completedClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "completedCell", for: indexPath)
//        cell.textLabel?.text = completedClasses.completedClasses[indexPath.row].courseName
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClassesCell", for: indexPath) as! ClassCell
        cell.con(name: String(completedClasses.completedClasses[indexPath.row].courseName), id:"\(completedClasses.completedClasses[indexPath.row].courseID)")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        classClicked.cclass = completedClasses.completedClasses[indexPath.row]
        CompletedClassesViewController.noShowButton = true
      
        performSegue(withIdentifier: "seeDetails", sender: nil)
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // share item at indexPath
            completedClasses.completedClasses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        delete.backgroundColor = UIColor.systemRed
        return [delete]
        
        // now only shows this one and not delete??
    }
    
}

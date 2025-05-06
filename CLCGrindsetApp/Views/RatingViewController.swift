//
//  RatingViewController.swift
//  CLCGrindsetApp
//
//  Created by PETER MICKLE on 4/17/25.
//

import UIKit

class RatingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        classesTaken.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = allCourses[indexPath.row].courseName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.courseToRate = classesTaken[indexPath.row]
        AppData.indexOfRate = indexPath.row
        performSegue(withIdentifier: "toRateOne", sender: self)
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

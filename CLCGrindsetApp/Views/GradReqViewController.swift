//
//  GradReqViewController.swift
//  CLCGrindsetApp
//
//  Created by MATTHEW FITCH on 4/17/25.
//

import UIKit

// this is a comment on yoru personality, >:( MEGA GROSS 2/10
//ignore the previous comment, that was not me, your personality is great :) keep going :D
class GradArrays {
    static var classes = ["English", "Math", "Science", "Computer Science", "Driver's Education", "Consumer Ed", "PE / Gym", "Social Science", "Elective"]
    
    static var creditReqs = [4.0, 3.0, 2.0, 1.0, 0.5, 0.25, 2.25, 2.0, 4.0]
    
    static var totalCreditReq = 20.25
}
class GradReqViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var reqTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        GradArrays.classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        //i fix yellow error :D
        let cell = reqTableView.dequeueReusableCell(withIdentifier: "ReqCell") as! ReqCell
        
        cell.customize(name: GradArrays.classes[index], creditText: "\(GradArrays.creditReqs[index]) credits required")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.reqType = indexPath.row
        AppData.viewIndex = indexPath.row
        performSegue(withIdentifier: "goReqType", sender: self)
    }
    

    //let classes = ["English", "Mathematics", "Science", "Computer science", "Drivers Ed", "Consumer Ed", "PE / Gym", "Social Science", "Electives"]
    
    //let totalCreditReq = 20.25
    
    //let creditReqs = [4.0, 3.0, 2.0, 1.0, 0.5, 0.25, 2.25, 2.0, 4.0]
    //commented code above was moved up and this is very nessisary to say
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        reqTableView.delegate = self
        reqTableView.dataSource = self
        
        reqTableView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation
     //HARK: - idk something about angels

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

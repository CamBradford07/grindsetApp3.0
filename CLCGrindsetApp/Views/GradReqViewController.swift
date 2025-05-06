//
//  GradReqViewController.swift
//  CLCGrindsetApp
//
//  Created by MATTHEW FITCH on 4/17/25.
//

import UIKit

class GradArrays {
    static var classes = ["English", "Mathematics", "Science", "Computer science", "Drivers Ed", "Consumer Ed", "PE / Gym", "Social Science", "Electives"]
    
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
        
        var cell = reqTableView.dequeueReusableCell(withIdentifier: "ReqCell") as! ReqCell
        
        cell.customize(name: GradArrays.classes[index], creditText: "\(GradArrays.creditReqs[index]) credits required")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goReqType", sender: self)
        AppData.reqType = indexPath.row
    }
    

    //let classes = ["English", "Mathematics", "Science", "Computer science", "Drivers Ed", "Consumer Ed", "PE / Gym", "Social Science", "Electives"]
    
    //let totalCreditReq = 20.25
    
    //let creditReqs = [4.0, 3.0, 2.0, 1.0, 0.5, 0.25, 2.25, 2.0, 4.0]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        reqTableView.delegate = self
        reqTableView.dataSource = self
        
        reqTableView.layer.cornerRadius = 10
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

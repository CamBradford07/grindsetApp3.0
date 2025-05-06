//
//  TakenClassesViewController.swift
//  CLCGrindsetApp
//
//  Created by RYAN STARK on 5/1/25.
//

import UIKit

class TakenClasses{
    
}

class TakenClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return takenClasses.count
        return 1
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TakenCell", for: indexPath)
        cell.textLabel?.text = ""
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        subjectClicked.subject =
//        performSegue(withIdentifier: "seeClasses", sender: nil)
    }

}

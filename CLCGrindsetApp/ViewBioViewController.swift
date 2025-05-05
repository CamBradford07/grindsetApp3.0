//
//  ViewBioViewController.swift
//  CLCGrindsetApp
//
//  Created by EVAN MEYER on 5/4/25.
//

import UIKit

class ViewBioViewController: UIViewController {

    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var teacherNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teacherNameLabel.text = AppData.teachers[0].name
        bioLabel.text = AppData.teachers[0].bio
        
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

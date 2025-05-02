//
//  TeacherSpecificRankViewController.swift
//  CLCGrindsetApp
//
//  Created by EVAN MEYER on 5/1/25.
//

import UIKit

class TeacherSpecificRankViewController: UIViewController {

    @IBOutlet weak var nameOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOutlet.text = "\(AppData.teacherCourseClicked)"
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

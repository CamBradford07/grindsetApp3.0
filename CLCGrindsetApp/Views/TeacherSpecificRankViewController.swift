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
        nameOutlet.text = "Difficulty: \(allRanks[AppData.teacherIndex].getDifficultyRank())\nFun: \(allRanks[AppData.teacherIndex].getFunRank())\nUsefulness: \(allRanks[AppData.teacherIndex].getUsefulnessRank())\n Work Load: \(allRanks[AppData.teacherIndex].getWorkRank())"
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

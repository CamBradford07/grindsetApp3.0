//
//  ClassDetailViewController.swift
//  CLCGrindsetApp
//
//  Created by RYAN STARK on 4/23/25.
//

import UIKit

class ClassDetailViewController: UIViewController  {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = classClicked.cclass.courseName
        subjectLabel.text = "Subject: \(classClicked.cclass.subject)"
        creditLabel.text = "Credits: \(classClicked.cclass.credits)"
        gradeLabel.text = "\(classClicked.cclass.eligibleGrades)"
        textView.text = "•Required Classes: \(classClicked.cclass.prerequisite)\n•\(classClicked.cclass.term)\n•Fun Rating: \(allRanks[AppData.viewIndex].getFunRank())\n•Difficulty Rating: \(allRanks[AppData.viewIndex].getDifficultyRank())\n•Usefulness Rating: \(allRanks[AppData.viewIndex].getUsefulnessRank())\n•Work Load Rating: \(allRanks[AppData.viewIndex].getWorkRank())\n•Description \(classClicked.cclass.description)\n•Notes: \(classClicked.cclass.enrollmentNotes)"
        
        if CompletedClassesViewController.noShowButton{
            addButton.isHidden = true
        } else {
            addButton.isHidden = false
        }
        
    }
    @IBAction func addToSchedule(_ sender: Any) {
        classClicked.selectedClasses.append(classClicked.cclass)

        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
        
        //classClicked.selectedClass = currentSubjectClasses[periodClicked.selectedPeriod].courseName
        //currentSubjectClasses[periodClicked.selectedPeriod] = classClicked.cclass.courseName
    }
    
}

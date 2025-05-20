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
        if allRanks[classClicked.cclass.courseID] != nil{
            textView.text = "•Required Classes: \(classClicked.cclass.prerequisite)\n•\(classClicked.cclass.term)\n•Fun Rating: \(allRanks[classClicked.cclass.courseID]!.getFunRank())\n•Difficulty Rating: \(allRanks[classClicked.cclass.courseID]!.getDifficultyRank())\n•Usefulness Rating: \(allRanks[classClicked.cclass.courseID]!.getUsefulnessRank())\n•Work Load Rating: \(allRanks[classClicked.cclass.courseID]!.getWorkRank())\n•Description \(classClicked.cclass.description)\n•Notes: \(classClicked.cclass.enrollmentNotes)"
        }else{
            textView.text = "•Required Classes: \(classClicked.cclass.prerequisite)\n•\(classClicked.cclass.term)\n•Fun Rating:  0.0\n•Difficulty Rating:  0.0\n•Usefulness Rating: 0.0\n•Work Load Rating: 0.0\n•Description \(classClicked.cclass.description)\n•Notes: \(classClicked.cclass.enrollmentNotes)"
        }
       
        
        if CompletedClassesViewController.noShowButton{
            addButton.isHidden = true
        } else {
            addButton.isHidden = false
        }
        
    }
    @IBAction func addToSchedule(_ sender: Any) {
        
        
        
        let alert = UIAlertController(title: "Add Both Classes?", message: "This class is a year long class, would you like to add both semesters?", preferredStyle: .alert)
        let Both = UIAlertAction(title: "Add Both", style: .default) {(action) in
            classClicked.selectedClasses.append(classClicked.cclass)
            AppData.currentStudent.selectedClasses.append(classClicked.cclass.courseID)
            let otherClass = allCourses.first(where: {
                    $0.courseName == classClicked.cclass.courseName &&
                    $0.courseID != classClicked.cclass.courseID
            }) //chat help
            classClicked.selectedClasses.append(otherClass!)
            AppData.currentStudent.selectedClasses.append(otherClass!.courseID)
            AppData.currentStudent.saveChanges(docRef: AppData.ref)
            self.performSegue(withIdentifier: "allTheWayBack", sender: nil)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            }
        let One = UIAlertAction(title: "Add One", style: .default) {(action) in
            classClicked.selectedClasses.append(classClicked.cclass)
            AppData.currentStudent.selectedClasses.append(classClicked.cclass.courseID)
            AppData.currentStudent.saveChanges(docRef: AppData.ref)
            self.performSegue(withIdentifier: "allTheWayBack", sender: nil)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
            self.navigationController?.popViewController(animated: false)
        }
        alert.addAction(Both)
        alert.addAction(One)
        
        self.present(alert, animated: true)


        

        
        //classClicked.selectedClass = currentSubjectClasses[periodClicked.selectedPeriod].courseName
        //currentSubjectClasses[periodClicked.selectedPeriod] = classClicked.cclass.courseName
    }
    
    func createAlert(alertTitle: String, alertDesc: String){
            let alert = UIAlertController(title: alertTitle, message: alertDesc, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    
    
    
}

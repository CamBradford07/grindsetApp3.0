//
//  EditTeachProfileViewController.swift
//  CLCGrindsetApp
//
//  Created by AVA SCHMIDT on 4/24/25.
//

import UIKit

class EditTeachProfileViewController: UIViewController {
    
    @IBOutlet weak var bioOutlet: UITextField!
    @IBOutlet weak var teacherNameOutlet: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func enterAction(_ sender: UIButton) {
        
        if teacherNameOutlet.text != ""{
            var teacherName = teacherNameOutlet.text!
            var bio = "Teacher Has Not Added A Bio Yet!"
            if bioOutlet.text != ""{
                bio = bioOutlet.text!
            }
            else{
                print("No bio inputed")
            }
            AppData.teachers.append(Teacher(name: teacherName, bio: bio))
        }
        else{
            print("No name inputed")
        }
        
        
    }
  
    
    
    

}

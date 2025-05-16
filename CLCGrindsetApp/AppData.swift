//
//  AppData.swift
//  CLCGrindsetApp
//
//  Created by PETER MICKLE on 4/17/25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore


class AppData{
    
    
    static var courseToRate: Course?
    static var teacherCourseClicked: Course?
    
    
    static var studentSchedule = ["No class selected", "No class selected", "No class selected", "No class selected", "No class selected", "No class selected", "No class selected", "No class selected", "No class selected"]
    
    
    
    static var ref: DocumentReference!
    static var rankRef: DocumentReference!
    static var ids = [String]()
    static var students = [Student]()
    
    static var currentStudent: Student!
    
    static var defaults = UserDefaults.standard
    
    static var reqType = -1
    
    static var bio = ""
    
    static var teachers = [Teacher]()
    
    
    static func saveUserAndPass(){
        if let currentStudent = currentStudent{
            // check if it even exists
            defaults.set(currentStudent.id, forKey: "ID")
        }
    }
    
    static func loadSelectedClasses(){
        classClicked.selectedClasses.removeAll()
        print(allCourses)
        
        for classID in currentStudent.selectedClasses{
            if let newCourse = getCourseByID(id: classID){
                print("Success")
                classClicked.selectedClasses.append(newCourse)
            }else{
                print("Error")
            }
        }
    }
    
}

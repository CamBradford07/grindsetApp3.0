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
    static var indexOfRate = -1
    
    static var studentSchedule = ["No class selected", "No class selected", "No class selected", "No class selected", "No class selected", "No class selected", "No class selected", "No class selected", "No class selected"]
    
    static var rateIndex = -1
    
    static var ref: DocumentReference!
    static var usernames = [String]()
    static var passwords = [String]()
    static var students = [Student]()
    
    static var currentStudent: Student!
    
    static var defaults = UserDefaults.standard
    
    static var reqType = -1
    
    static var bio = ""
    
    static var teachers = [Teacher]()
    
    static func saveUserAndPass(){
        if let currentStudent = currentStudent{
            // check if it even exists
            defaults.set(currentStudent.username, forKey: "username")
            defaults.set(currentStudent.password, forKey: "password")
        }
    }
    

    
}

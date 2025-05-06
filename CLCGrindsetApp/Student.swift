//
//  Student.swift
//  CLCGrindsetApp
//
//  Created by CAMERON BRADFORD on 4/23/25.
//

import Foundation
import FirebaseFirestore

class Student{
    var username: String!
    var password: String!
    var gradeLevel: Int!
    var selectedClasses: [String]!
    var name: String!
    var age: Int!
    var takenClasses: [String]!
    var rankToBeSaved: Rank!
    var bio: String!
    
    init(username: String!, password: String!, gradeLevel: Int!, selectedClasses: [String]!, name: String!, age: Int!, takenClasses: [String]!) {
        self.username = username
        self.password = password
        self.gradeLevel = gradeLevel
        self.selectedClasses = selectedClasses
        self.name = name
        self.age = age
        self.takenClasses = takenClasses
        self.rankToBeSaved = Rank()
    }
    
    init(dict: [String : Any]){
        if let username = dict["Username"] as? String{
            self.username = username
        }
        else{self.username = ""}
        if let password = dict["Password"] as? String{
            self.password = password
        }
        else{self.password = ""}
        if let gradeLevel = dict["gradeLevel"] as? Int{
            self.gradeLevel = gradeLevel
        }
        else{self.gradeLevel = 9}
        if let selectedClasses = dict["SelectedClasses"] as? [String]{
            self.selectedClasses = selectedClasses
        }
        else{self.selectedClasses = [String]()}
        if let name = dict["Name"] as? String{
            self.name = name
        }
        else{self.name = ""}
        if let age = dict["Age"] as? Int{
            self.age = age
        }
        else{self.age = 0}
        if let takenClasses = dict["TakenClasses"] as? [String]{
            self.takenClasses = takenClasses
        }else{
            self.takenClasses = [String]()
        }
        if let hi = dict["Ranks"] as? Data{
            if let decoded = try? JSONDecoder().decode(Rank.self, from: hi){
                self.rankToBeSaved = decoded
            }else{
                self.rankToBeSaved = Rank()
            }
        }
        
    }
    
    func addToFirebase(docRef: DocumentReference){
        var rankInfo: Data?
        if let encoded = try? JSONEncoder().encode(rankToBeSaved){
            rankInfo = encoded
        }
        
        let informationDict = ["Username" : username!, "Password" : password!, "GradeLevel" : gradeLevel!, "SelectedClasses" : selectedClasses!, "Name" : name!, "Age" : age!, "TakenClasses" : takenClasses!, "Ranks":rankInfo!] as! [String : Any]
        let uploadableStud = [username : informationDict] as! [String : Any]
        docRef.setData(uploadableStud, merge: true)
    }
    
    func saveChanges(docRef: DocumentReference){
        var rankInfo: Data?
        if let encoded = try? JSONEncoder().encode(rankToBeSaved){
            rankInfo = encoded
        }
        let informationDict = ["Username" : username!, "Password" : password!, "GradeLevel" : gradeLevel!, "SelectedClasses" : selectedClasses!, "Name" : name!, "Age" : age!, "TakenClasses" : takenClasses!, "Ranks":rankInfo!] as! [String : Any]
        let uploadableStud = [username : informationDict] as! [String : Any]
        docRef.updateData(uploadableStud)
    }
    
}

//
//  Student.swift
//  CLCGrindsetApp
//
//  Created by CAMERON BRADFORD on 4/23/25.
//

import Foundation
import FirebaseFirestore

class Student{
    var gradeLevel: Int!
    var selectedClasses: [String]!
    var takenClasses: [String]!
    var rankToBeSaved: Rank!
    var id: String
    var bio: String!
    var isStudent: Bool!
    
    init(id: String!, gradeLevel: Int!, selectedClasses: [String]!, takenClasses: [String]!) {
        self.gradeLevel = gradeLevel
        self.selectedClasses = selectedClasses
        self.takenClasses = takenClasses
        self.rankToBeSaved = Rank()
        self.id = id
        self.isStudent = true
    }
    
    init(dict: [String : Any]){
        if let id = dict["ID"] as? String{
            self.id = id
        }
        else{self.id = "INVALID"}
        if let gradeLevel = dict["gradeLevel"] as? Int{
            self.gradeLevel = gradeLevel
        }
        else{self.gradeLevel = 9}
        if let selectedClasses = dict["SelectedClasses"] as? [String]{
            self.selectedClasses = selectedClasses
        }
        else{self.selectedClasses = [String]()}
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
        if let bananas = dict["isStudent"] as? Bool{
            self.isStudent = bananas
        }
        
    }
    
    func addToFirebase(docRef: DocumentReference){
        var rankInfo: Data?
        if let encoded = try? JSONEncoder().encode(rankToBeSaved){
            rankInfo = encoded
        }
        
        let informationDict = ["ID": id, "GradeLevel" : gradeLevel!, "SelectedClasses" : selectedClasses!,  "TakenClasses" : takenClasses!, "Ranks":rankInfo!, "isStudent" : isStudent!] as! [String : Any]
        let uploadableStud = [id : informationDict] as! [String : Any]
        docRef.setData(uploadableStud, merge: true)
    }
    
    func saveChanges(docRef: DocumentReference){
        var rankInfo: Data?
        if let encoded = try? JSONEncoder().encode(rankToBeSaved){
            rankInfo = encoded
        }
        let informationDict = ["ID": "\(id)", "GradeLevel" : gradeLevel!, "SelectedClasses" : selectedClasses!,  "TakenClasses" : takenClasses!, "Ranks":rankInfo!, "isStudent" : isStudent!] as! [String : Any]
        let uploadableStud = ["\(id)" : informationDict] as! [String : Any]
        docRef.setData(uploadableStud, merge: true)
//        docRef.updateData(uploadableStud)
    }
    
}

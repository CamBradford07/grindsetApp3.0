//
//  ClassesStuct.swift
//  CLCGrindsetApp
//
//  Created by RYAN STARK on 4/16/25.
//

import Foundation

var allCourses: [Course] = []
var filteredCourses: [Course] = []
var classesTaken: [Course] = []

struct Course {
    var courseID: String
    var courseName: String
    var credits: String
    var subject: String
    var term: String
    var eligibleGrades: String
    var prerequisite: String
    var corequisite: String
    var enrollmentNotes: String
    var description: String
    var isElective: String
    var courseType: String
    
    var totalFunRank: [Double] = []
    
    var totalDifficultyRank: [Double] = []
    
    var totalUsefulnessRank: [Double] = []
    
    var totalWorkRank: [Double] = []
    
}


func loadCoursesFromCSV() {
    guard let filePath = Bundle.main.path(forResource: "Classes", ofType: "tsv") else {
        print("CSV file not found")
        return
    }

    do {
        let data = try String(contentsOfFile: filePath, encoding: .utf8)
        var rows = data.components(separatedBy: .newlines).filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
        rows.removeFirst()

        for (index, row) in rows.enumerated() {
            let columns = row.components(separatedBy: "\t")

            if columns.count < 12 {
                print("Skipping row \(index + 2): expected 12 columns, got \(columns.count)")
                continue
            }
            if columns.count > 12 {
                print("Skipping row \(index + 2): expected 12 columns, got \(columns.count)")
                continue
            }

            let course = Course(
                courseID: columns[0],
                courseName: columns[1],
                credits: columns[2],
                subject: columns[3],
                term: columns[4],
                eligibleGrades: columns[5],
                prerequisite: columns[6],
                corequisite: columns[7],
                enrollmentNotes: columns[8],
                description: columns[9],
                isElective: columns[10],
                courseType: columns[11]
               
            )
            allCourses.append(course)
        }

    } catch {
        print("Error reading CSV: \(error)")
    }
}

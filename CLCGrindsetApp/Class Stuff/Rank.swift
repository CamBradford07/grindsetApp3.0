//
//  Rank.swift
//  CLCGrindsetApp
//
//  Created by PETER MICKLE on 5/1/25.
//

import Foundation

//paralell array with all courses
var allRanks: [String:Rank] = [:]




class Rank: Codable{
    
    var totalFunRank: [Double] = []
    
    var totalDifficultyRank: [Double] = []
    
    var totalUsefulnessRank: [Double] = []
    
    var totalWorkRank: [Double] = []
    
    
    
    func getFunRank() -> Double{
        if totalFunRank.isEmpty{
            return 0.0
        }else{
            var combinedFunRank = 0.0
            for i in 0...totalFunRank.count-1{
                combinedFunRank += totalFunRank[i]
            }
            combinedFunRank /= Double(totalFunRank.count)
            return combinedFunRank
        }
        
        
    }
    
    func getDifficultyRank() -> Double{
        if totalDifficultyRank.isEmpty{
            return 0.0
        }else{
            var combinedDifficultyRank = 0.0
            for i in 0...totalDifficultyRank.count-1{
                combinedDifficultyRank += totalDifficultyRank[i]
            }
            combinedDifficultyRank /= Double(totalDifficultyRank.count)
            return combinedDifficultyRank
        }
        
        
    }
    
    func getUsefulnessRank() -> Double{
        if totalUsefulnessRank.isEmpty{
            return 0.0
        }else{
            var combinedUsefulnessRank = 0.0
            for i in 0...totalUsefulnessRank.count-1{
                combinedUsefulnessRank += totalUsefulnessRank[i]
            }
            combinedUsefulnessRank /= Double(totalUsefulnessRank.count)
            return combinedUsefulnessRank
        }
        
        
    }
    
    func getWorkRank() -> Double{
        if totalWorkRank.isEmpty{
            return 0.0
        }else{
            var combinedWorkRank = 0.0
            for i in 0...totalWorkRank.count-1{
                combinedWorkRank += totalWorkRank[i]
            }
            combinedWorkRank /= Double(totalWorkRank.count)
            return combinedWorkRank
        }
        
        
    }
    
    
}

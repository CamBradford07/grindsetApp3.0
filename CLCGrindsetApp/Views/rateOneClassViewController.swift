//
//  rateOneClassViewController.swift
//  CLCGrindsetApp
//
//  Created by PETER MICKLE on 4/21/25.
//

import UIKit







class rateOneClassViewController: UIViewController{
    
    @IBOutlet weak var funSegment: UISegmentedControl!
    @IBOutlet weak var difSegment: UISegmentedControl!
    @IBOutlet weak var useSegment: UISegmentedControl!
    @IBOutlet weak var workSegment: UISegmentedControl!
    
    @IBOutlet weak var titleOutletOneRate: UILabel!
    
    var fun : Double?
    var dif : Double?
    var use : Double?
    var work : Double?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let name = AppData.courseToRate?.courseName {
            titleOutletOneRate.text = "Please Rate \(name)"
        }else{
            titleOutletOneRate.text = "no class to Rate!"
        }
        
            funSegment.selectedSegmentIndex = 2
            difSegment.selectedSegmentIndex = 2
            useSegment.selectedSegmentIndex = 2
            workSegment.selectedSegmentIndex = 2
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        
        if allRanks[AppData.courseToRate!.courseID] == nil{
            var rank = Rank()
            rank.totalFunRank.append(fun ?? 3.0)
            rank.totalDifficultyRank.append(dif ?? 3.0)
            rank.totalWorkRank.append(work ?? 3.0)
            rank.totalUsefulnessRank.append(use ?? 3.0)
            
            allRanks[AppData.courseToRate!.courseID] = rank
        }else{
            var curRank = allRanks[AppData.courseToRate!.courseID]!
            curRank.totalFunRank.append(fun ?? 3.0)
            curRank.totalDifficultyRank.append(dif ?? 3.0)
            curRank.totalWorkRank.append(work ?? 3.0)
            curRank.totalUsefulnessRank.append(use ?? 3.0)
            allRanks[AppData.courseToRate!.courseID]! = curRank
        }

        
        
        
       
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    @IBAction func difSC(_ sender: UISegmentedControl) {
        var selectedIndex = sender.selectedSegmentIndex
        
        for i in 0...selectedIndex{
            sender.setImage(UIImage(systemName: "star.fill"), forSegmentAt: i)
        }
        if selectedIndex != 4{
            for i in selectedIndex+1...4{
                sender.setImage(UIImage(systemName: "star"), forSegmentAt: i)
            }
        }
        selectedIndex += 1
        dif = Double(selectedIndex)
    }
    
    
    @IBAction func FunnSC(_ sender: UISegmentedControl) {
        var selectedIndex = sender.selectedSegmentIndex
        
        for i in 0...selectedIndex{
            sender.setImage(UIImage(systemName: "star.fill"), forSegmentAt: i)
        }
        if selectedIndex != 4{
            for i in selectedIndex+1...4{
                sender.setImage(UIImage(systemName: "star"), forSegmentAt: i)
            }
        }
        selectedIndex += 1
        fun = Double(selectedIndex)
    }
    
   
    @IBAction func useSC(_ sender: UISegmentedControl) {
        var selectedIndex = sender.selectedSegmentIndex
        
        for i in 0...selectedIndex{
            sender.setImage(UIImage(systemName: "star.fill"), forSegmentAt: i)
        }
        if selectedIndex != 4{
            for i in selectedIndex+1...4{
                sender.setImage(UIImage(systemName: "star"), forSegmentAt: i)
            }
        }
        selectedIndex += 1
        use = Double(selectedIndex)
    }
    
    
    
    @IBAction func workSC(_ sender: UISegmentedControl) {
        var selectedIndex = sender.selectedSegmentIndex
        
        for i in 0...selectedIndex{
            sender.setImage(UIImage(systemName: "star.fill"), forSegmentAt: i)
        }
        if selectedIndex != 4{
            for i in selectedIndex+1...4{
                sender.setImage(UIImage(systemName: "star"), forSegmentAt: i)
            }
        }
        selectedIndex += 1
        work = Double(selectedIndex)
    }
    
    
    
    
}





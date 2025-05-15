//
//  rateOneClassViewController.swift
//  CLCGrindsetApp
//
//  Created by PETER MICKLE on 4/21/25.
//

import UIKit







class rateOneClassViewController: UIViewController{
    
    
    
    
    
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
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        allRanks[AppData.rateIndex].totalFunRank.append(fun ?? 1.0)
        
        allRanks[AppData.rateIndex].totalDifficultyRank.append(dif ?? 1.0)
        
        allRanks[AppData.rateIndex].totalUsefulnessRank.append(use ?? 1.0)
        
        allRanks[AppData.rateIndex].totalWorkRank.append(work ?? 1.0)
        
        
        
        print(allRanks[AppData.rateIndex].totalFunRank[0])
        print(allRanks[AppData.rateIndex].totalDifficultyRank[0])
        print(allRanks[AppData.rateIndex].totalUsefulnessRank[0])
        print(allRanks[AppData.rateIndex].totalWorkRank[0])
        
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





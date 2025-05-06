//
//  rateOneClassViewController.swift
//  CLCGrindsetApp
//
//  Created by PETER MICKLE on 4/21/25.
//

import UIKit







class rateOneClassViewController: UIViewController{
    
    
    
    
    
    @IBOutlet weak var titleOutletOneRate: UILabel!
    
    
    
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
        
    
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    @IBAction func difSC(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        for i in 0...selectedIndex{
            sender.setImage(UIImage(systemName: "star.fill"), forSegmentAt: i)
        }
        if selectedIndex != 4{
            for i in selectedIndex+1...4{
                sender.setImage(UIImage(systemName: "star"), forSegmentAt: i)
            }
        }
        AppData.courseToRate?.totalDifficultyRank.append(Double(selectedIndex))
    }
    
    
    @IBAction func FunnSC(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        for i in 0...selectedIndex{
            sender.setImage(UIImage(systemName: "star.fill"), forSegmentAt: i)
        }
        if selectedIndex != 4{
            for i in selectedIndex+1...4{
                sender.setImage(UIImage(systemName: "star"), forSegmentAt: i)
            }
        }
        AppData.courseToRate?.totalFunRank.append(Double(selectedIndex))
        
        allRanks[AppData.indexOfRate].totalFunRank.append(Double(selectedIndex))
        
    }
    
   
    @IBAction func useSC(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        for i in 0...selectedIndex{
            sender.setImage(UIImage(systemName: "star.fill"), forSegmentAt: i)
        }
        if selectedIndex != 4{
            for i in selectedIndex+1...4{
                sender.setImage(UIImage(systemName: "star"), forSegmentAt: i)
            }
        }
        AppData.courseToRate?.totalUsefulnessRank.append(Double(selectedIndex))
    }
    
    
    
    @IBAction func workSC(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        for i in 0...selectedIndex{
            sender.setImage(UIImage(systemName: "star.fill"), forSegmentAt: i)
        }
        if selectedIndex != 4{
            for i in selectedIndex+1...4{
                sender.setImage(UIImage(systemName: "star"), forSegmentAt: i)
            }
        }
        AppData.courseToRate?.totalWorkRank.append(Double(selectedIndex))
    }
    
    
    
    
}

//
//  rateOneClassViewController.swift
//  CLCGrindsetApp
//
//  Created by PETER MICKLE on 4/21/25.
//

import UIKit







class rateOneClassViewController: UIViewController{
    
    
    
    
    
    @IBOutlet weak var titleOutletOneRate: UILabel!
    
    var fun : Int?
    var dif : Int?
    var use : Int?
    var work : Int?
    
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
        
        AppData.currentStudent.rankToBeSaved.totalFunRank.append(Double(fun ?? 0))
        AppData.currentStudent.rankToBeSaved.totalDifficultyRank.append(Double(dif ?? 0))
        AppData.currentStudent.rankToBeSaved.totalWorkRank.append(Double(work ?? 0))
        AppData.currentStudent.rankToBeSaved.totalUsefulnessRank.append(Double(use ?? 0))
        
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
        dif = selectedIndex
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
        fun = selectedIndex
        
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
        use = selectedIndex
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
        work = selectedIndex
    }
    
    
    
    
}

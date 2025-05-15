//
//  ViewBioViewController.swift
//  CLCGrindsetApp
//
//  Created by EVAN MEYER on 5/4/25.
//

import UIKit

class ViewBioViewController: UIViewController {

    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var teacherNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

      

            // Do any additional setup after loading the view.
        if !AppData.teachers.isEmpty{
            teacherNameLabel.text = AppData.teachers[0].name
            bioLabel.text = AppData.teachers[0].bio
        }else{
            teacherNameLabel.text = "Information Unavailable"
            bioLabel.text = "Information Unavailable"
        }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


//hiiiiiiiiiii :)
//i was tasked with making random comments
//the mafia is after you
//yeah
//...
//why are you still reading these comments
/*
                |
      |         |      |
      |         |      |     |
      |         |      |     |
      |         |      |     |
                |
 ---------------|------------------
                |
     |    |     |      |
     |    |     |      |
     |    |     |      |   _____
     |    |     |      |
                |
 */
//matthew changed his comment about that comment
//heres another, more obscure

/*
 
        ___
       |   |
       |___|      T
         |        h C
        /|\       e o o
       / | \        n f B
      /  |  \       f   e H
         |          u   i u
        / \         s   n m
       /   \        i   g a
      /     \       o     n
                    n
 
 */
 //i doubt anyone knows where that comes from :)
//i gotta work now bye!!!!!!1!!one

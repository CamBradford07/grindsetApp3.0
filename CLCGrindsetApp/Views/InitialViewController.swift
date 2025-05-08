//
//  InitialViewController.swift
//  CLCGrindsetApp
//
//  Created by CAMERON BRADFORD on 4/23/25.
//

import UIKit
import FirebaseFirestore

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AppData.ref = Firestore.firestore().collection("data").document("Accounts")
        AppData.rankRef = Firestore.firestore().collection("data").document("Ranks")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

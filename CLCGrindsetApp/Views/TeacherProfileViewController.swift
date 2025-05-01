//  Created by AVA SCHMIDT on 5/1/25.


import UIKit

class TeacherProfileViewController: UIViewController {
    
    @IBOutlet weak var bioOutlet: UITextView!
    @IBOutlet weak var userOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userOutlet.text = "\(AppData.teachers[0].name)"
        bioOutlet.text = "\(AppData.teachers[0].bio)"
        
    }
    



}

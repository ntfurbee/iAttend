//
//  LoginViewController.swift
//  New_Attendance_App
//
//  Created by Robert Miller on 4/9/18.
//  Copyright © 2018 Robert Miller. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    @IBAction func goToStudentHome(_ sender:Any){
        self.performSegue(withIdentifier: "toStudentHomeScreen", sender:self)
    }
    
    @IBAction func goToTeacherHome(_ sender:Any){
        self.performSegue(withIdentifier: "toTeacherHomeScreen", sender:self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

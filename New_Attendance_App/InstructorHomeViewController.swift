//
//  InstructorHomeViewController.swift
//  New_Attendance_App
//
//  Created by Robert Miller on 4/10/18.
//  Copyright © 2018 Robert Miller. All rights reserved.
//

import UIKit
import Firebase

class InstructorHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        dump(mainInstance.instructors)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleLogout(_ sender: Any) {
        try! Auth.auth().signOut()
        mainInstance.currentInstructor?.loggedIn = false
        mainInstance.currentInstructor = nil
        self.performSegue(withIdentifier: "backToHomeScreen", sender: self)
    }
    
    @IBAction func enableAttendance(_ sender: Any){
        attendanceOpen = true;
    }
    
    @IBAction func retrieveInstructors(_sender: Any) {
        dump(mainInstance.instructors)
    }
    
    @IBAction func disableAttendance(_ sender: Any){
        attendanceOpen = false;
    }
    
    @IBAction func sendToLocation(_ sender: Any){
        self.performSegue(withIdentifier: "toLocation", sender: self)
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

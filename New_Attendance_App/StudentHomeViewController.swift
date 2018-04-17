//
//  StudentHomeViewController.swift
//  New_Attendance_App
//
//  Created by Robert Miller on 4/10/18.
//  Copyright © 2018 Robert Miller. All rights reserved.
//

import UIKit
import Firebase

class StudentHomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var attendanceButton: UIButton!
    
    
    let classes = ["EE 327", "EE 355", "CS 350", "CS 450"]
    
    var didAttend = false
    
    override func viewDidLoad() {
        pickerView.isHidden = true
        
        pickerView.delegate = self
        pickerView.dataSource = self
        super.viewDidLoad()
    }
    
    @IBAction func handleLogout(_ sender: Any) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "backToHomeScreen", sender: self)
    }
    
    
    @IBAction func attendancePressed(_ sender: UIButton){
        if pickerView.isHidden{
            pickerView.isHidden = false
        }
        
        didAttend = true
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return classes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classes[row]
    }
 
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

//
//  LoginViewController.swift
//  New_Attendance_App
//
//  Created by Robert Miller on 4/9/18.
//  Copyright © 2018 Robert Miller. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    @IBAction func goToStudentHome(_ sender:Any){
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                
                /*
                 if (user?.email?.contains("mail.wvu.edu"))!{
                 let vc = self.storyboard?.instantiateViewController(withIdentifier: "InstructorHomeViewController")
                 
                 self.present(vc!, animated: true, completion: nil)
                 
                 }
                 
                 
                 if (user?.email?.contains("mix.wvu.edu"))!{
                 let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentHomeViewController")
                 
                 self.present(vc!, animated: true, completion: nil)
                 }
                 */
                
                self.dismiss(animated: false, completion: nil)
            } else {
                print("Error logging in: \(error!.localizedDescription)")
            }
            self.performSegue(withIdentifier: "toStudentHomeScreen", sender:self)
        }
    }
    
    @IBAction func goToTeacherHome(_ sender:Any){
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
            } else {
                print("Error logging in: \(error!.localizedDescription)")
            }
            self.performSegue(withIdentifier: "toInstructorHomeScreen", sender:self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender:Any){
        self.performSegue(withIdentifier: "backToHome", sender:self)
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

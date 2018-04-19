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
    @IBOutlet weak var errorMessage: UILabel!

    @IBAction func loginButton(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                if email.range(of:"mail") != nil {
                    dump(mainInstance.instructors)
                    for i in mainInstance.instructors {
                        if i.getEmail() == email {
                            mainInstance.currentInstructor = i
                            i.loggedIn = true
                            print("Instructor found from global list with username: ",i.getUsername())
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toInstructorHomeScreen", sender:self)

                }
                else {
                    dump(mainInstance.students)
                    for i in mainInstance.students {
                        if i.getEmail() == email {
                            mainInstance.currentStudent = i
                            i.loggedIn = true
                            print("Student found from global list with username: ",i.getUsername())
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toStudentHomeScreen", sender:self)

                }
                
                //self.dismiss(animated: false, completion: nil)
            } else {
                print("Error logging in: \(error!.localizedDescription)")
            }
        }
    }
   /*
    @IBAction func goToStudentHome(_ sender:Any){
        guard let email = emailField.text else { return }
        guard let pass = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
                for i in mainInstance.students {
                    if i.getEmail() == email {
                        mainInstance.currentStudent = i
                        i.loggedIn = true
                        print("Student found from global list with username: ",i.getUsername())
                    }
                }
                
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
                for i in mainInstance.instructors {
                    if i.getEmail() == email{
                        mainInstance.currentInstructor = i
                        i.loggedIn = true
                        print("instructor found from global list with properties: \n ",i.getUsername())
                    }
                }
                self.performSegue(withIdentifier: "toInstructorHomeScreen", sender:self)
            }
            else {
                print("Error logging in: \(error!.localizedDescription)")
                self.errorMessage.isHidden = false
            }
         
        }
    }
 
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        errorMessage.isHidden = true
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

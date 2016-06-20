//
//  LoginViewController.swift
//  Facebook
//
//  Created by Alexandra Saunders on 5/26/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    var activeY: CGFloat!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        initialY = fieldParentView.frame.origin.y
        offset = -50
        activeY = fieldParentView.frame.origin.y + offset
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("showkeyboard")
        fieldParentView.frame.origin.y = activeY
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onPressLogin(sender: AnyObject) {
        
        spinner.startAnimating()
        loginButton.selected = true
        if emailField.text == "shopper@walmart.com" && passwordField.text == "password" {
            // Code that runs if both email and password match the text we are looking for in each case
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.spinner.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // perform the Segue to the next scren.
                self.performSegueWithIdentifier("loginSuccess", sender: nil)
            })
        } else {
            // Code that runs if either the email or password do NOT match the text we are looking for in each case
            delay(2, closure: { () -> () in
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
                let alertController = UIAlertController(title: "Oops!", message: "Invalid email/password combination", preferredStyle: .Alert)
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                // Stop animating the activity indicator.
                self.spinner.stopAnimating()
            })
        }
    }

    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

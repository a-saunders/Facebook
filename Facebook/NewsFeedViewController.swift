//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    @IBOutlet var imageView: [UIImageView]!
    
    var selectedImageView: UIImageView!
    
    var imageTransition: ImageTransition!
    
      var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    // Right before the ViewController "appears"...
//    override func viewWillAppear(animated: Bool) {
//        // hide feed ImageView
//        feedImageView.hidden = true
//        // turn on the activity indicator
//        loginIndicator.startAnimating()
//    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        scrollView.contentInset.top = 0
//        scrollView.contentInset.bottom = 50
//        scrollView.scrollIndicatorInsets.top = 0
//        scrollView.scrollIndicatorInsets.bottom = 50
//        
//        // Delay for 2 seconds before...
//        delay(2) { () -> () in
//            // show the feed ImageView
//            self.feedImageView.hidden = false
//            // Stop the activity indicator
//            self.loginIndicator.stopAnimating()
//        }
//    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        
                
        destinationViewController.image = selectedImageView.image

        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        imageTransition = ImageTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = imageTransition
        
        // Adjust the transition duration. (seconds)
        imageTransition.duration = 0.75
    }

    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
        
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("photoSegue", sender: self)
        
    }
    
    
    
    func onRefresh() {
        
    }
}

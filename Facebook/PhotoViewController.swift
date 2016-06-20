//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Alexandra Saunders on 6/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var image: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var actionsImage: UIImageView!
    @IBOutlet weak var doneImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 658)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        print("didscroll")
        scrollView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        doneImage.alpha = 0
        actionsImage.alpha = 0
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
            if scrollView.contentOffset.y < 100 {
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                UIView.animateWithDuration(0.35, animations: { () -> Void in
                    self.doneImage.alpha = 1
                    self.actionsImage.alpha = 1
                    scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
                })
            }
            
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
        UIView.animateWithDuration(0.3) { () -> Void in
           scrollView.backgroundColor = UIColor(white: 0, alpha: 1)

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

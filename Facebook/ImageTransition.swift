//
//  ImageTransition.swift
//  Facebook
//
//  Created by Alexandra Saunders on 6/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        movingImageView.image = feedViewController.selectedImageView.image
        movingImageView.frame = feedViewController.selectedImageView.frame
        feedViewController.selectedImageView.contentMode = feedViewController.selectedImageView.contentMode

        
        containerView.addSubview(movingImageView)
        
        feedViewController.selectedImageView.alpha = 0
        photoViewController.imageView.alpha = 0
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            movingImageView.frame = photoViewController.imageView.frame

            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                feedViewController.selectedImageView.alpha = 1
                movingImageView.alpha = 0
                self.finish()
                
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }

}

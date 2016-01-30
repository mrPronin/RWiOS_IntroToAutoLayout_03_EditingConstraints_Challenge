//
//  ViewController.swift
//  AutoLayout_Challenge6
//
//  Created by Jerry Beers on 8/12/15.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Vars
    var bios: [String]!
    var names: [String]!
    let minWidth: CGFloat = 50
    let maxWidth: CGFloat = 100
    var currentImageView: UIImageView? = nil
    
    //MARK: - Outlets
    @IBOutlet var widthConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var email: UIButton!
    @IBOutlet var images: [UIImageView]!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for imageView in images {
            let tap = UITapGestureRecognizer(target: self, action: "imageTapped:")
            tap.numberOfTapsRequired = 1
            imageView.addGestureRecognizer(tap)
        }
        
        hideInfo()
        
        bios = [
            "Ray is an indie software developer currently focusing on iPhone and iPad development, and the administrator of this site. He’s the founder of a small iPhone development studio called Razeware, and is passionate both about making apps and teaching others the techniques to make them.",
            "Vicki Wenderlich discovered a love of digital art in 2009, and has been making app art and digital illustrations ever since. She is passionate about helping people pursue their dreams, and makes free app art for developers available on her website, http://www.vickiwenderlich.com.",
            "Greg is an iOS developer and trainer, and has been on the raywenderlich.com editorial team since 2012. He has been nerding out with computers since the Commodore 64 era in the 80s and continues to this day on the web and on iOS. He likes caffeine, codes with two-space tabs, and writes with semicolons.",
            "Mic Pringle is a developer, editor, podcaster, and video tutorial maker. He's also Razeware's third full-time employee. When not knee-deep in Swift or stood in-front of his green screen, he enjoys spending time with his wife Lucy and their daughter Evie, as-well as attending the football matches of his beloved Fulham FC. You can find Mic on Twitter, GitHub, and Stack Overflow.",
            "Christine is Ray's administrative assistant. She tries to keep order in the ever expanding world of raywenderlich.com so that Ray and the team can stay focused on making more tutorials, books, and apps!"]
        names = ["Ray Wenderlich", "Vicki Wenderlich", "Greg Heo", "Mic Pringle", "Christine Sweigart"]
    }
    
    func imageTapped(sender: UITapGestureRecognizer)
    {
        let image: UIImageView? = sender.view as? UIImageView
        guard let tag = image?.tag else { return }
        let widthConstraint: NSLayoutConstraint = widthConstraints[tag]
        if currentImageView != nil && currentImageView != image {
            let currentWidthConstraint: NSLayoutConstraint = widthConstraints[(currentImageView?.tag)!]
            currentWidthConstraint.constant = minWidth
            currentImageView = nil
        }
        if widthConstraint.constant == minWidth {
            widthConstraint.constant = maxWidth
            currentImageView = image
        } else {
            widthConstraint.constant = minWidth
            currentImageView = nil
        }
        if currentImageView != nil {
            showInfoWithTag(tag)
        } else {
            hideInfo()
        }
        UIView.animateWithDuration(0.3) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }
    
    func hideInfo() {
        label.hidden = true
        textView.hidden = true
        email.hidden = true
    }
    
    func showInfoWithTag(tag: Int) {
        label.text = names[tag]
        textView.text = bios[tag]
        label.hidden = false
        textView.hidden = false
        email.hidden = false
    }
}


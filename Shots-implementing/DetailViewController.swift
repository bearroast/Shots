//
//  DetailViewController.swift
//  Shots-implementing
//
//  Created by Bjørn Eivind Rostad on 8/8/14.
//  Copyright (c) 2014 Bjørn Eivind Rostad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        performSegueWithIdentifier("detailToHome", sender: sender)
        
    }
    
    var data = Array<Dictionary<String,String>>()
    var number = 0
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "detailToHome" {
            let controller = segue.destinationViewController as HomeViewController
            controller.data = data
            controller.number = number
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.image = UIImage(named: data[number]["avatar"])
        authorLabel.text = data[number]["author"]
        descriptionTextView.text = data[number]["text"]
        imageView.image = UIImage(named: data[number]["image"])
    }

    

}

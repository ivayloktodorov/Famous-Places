//
//  DetailViewController.swift
//  Famous Places
//
//  Created by Ivaylo Todorov on 31.10.17.
//  Copyright © 2017 Ivaylo Todorov. All rights reserved.
//

import UIKit
import MessageUI

class DetailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var desctiptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    public var descrLabel = ""
    public var descrTextView = ""
    public var imageLink = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }
    
    
   
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients([])
        mailVC.setSubject("Welcome to " + descrLabel)
        mailVC.setMessageBody(descrTextView, isHTML: false)
        present(mailVC, animated: true, completion: nil)
        
    }
    
    // MARK: - Email Delegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func reloadData() {
        desctiptionLabel.text = descrLabel
        descriptionTextView.text = descrTextView
        let imgURL = imageLink
        self.detailsImage.setImageFromURl(stringImageUrl: imgURL)
    }



}

//
//  ViewController.swift
//  fiNDme
//
//  Created by Cory Jbara on 11/13/16.
//  Copyright © 2016 coryjbara. All rights reserved.
//

import UIKit
import ALAccordion

class AccordionViewController: ALAccordionController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let section1 = storyboard.instantiateViewController(withIdentifier: "aboutVC") as! AboutViewController
        let section2 = storyboard.instantiateViewController(withIdentifier: "jobsVC") as! JobsViewController
        let section3 = storyboard.instantiateViewController(withIdentifier: "contactVC") as! ContactCompanyViewController
        
        self.setViewControllers(section1, section2, section3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class AboutViewController: UIViewController, ALAccordionSectionDelegate
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Add gesture recognizer to header
        self.headerView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
        )
    }
    
    func sectionWillOpen(animated: Bool)
    {
        print("First Section Will Open")
        
        let duration = animated ? self.accordionController!.animationDuration : 0.0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations:
            {
                let h = self.headerView as! ALSingleLineHeaderView
                h.topSeparator.alpha = 0
        },
                       completion: nil)
    }
    
    func sectionWillClose(animated: Bool)
    {
        print("First Section Will Close")
        
        let duration = animated ? self.accordionController!.animationDuration : 0.0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations:
            {
                let h = self.headerView as! ALSingleLineHeaderView
                h.topSeparator.alpha = 1.0
        },
                       completion: nil)
    }
    
    //
    // MARK: - Gesture Recognizer
    //
    
    func headerTapped(_ recognizer: UITapGestureRecognizer)
    {
        // Get the section index for this view controller
        if let sectionIndex = self.accordionController?.sectionIndexForViewController(self)
        {
            print("First view controller header tapped")
            
            // If this section is open, close it - otherwise, open it
            if self.accordionController!.openSectionIndex == sectionIndex
            {
                self.accordionController?.closeSectionAtIndex(sectionIndex, animated: true)
            }
            else
            {
                self.accordionController?.openSectionAtIndex(sectionIndex, animated: true)
            }
        }
    }
    
    // MARK: - ALAccordionControllerDelegate
    
    // Required
    let headerView: UIView =
        {
            let header = ALSingleLineHeaderView()
            header.titleLabel.text = "About"
            header.titleLabel.textColor = UIColor.black
            
            return header
    }()
}

class JobsViewController: UIViewController, ALAccordionSectionDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Add gesture recognizer to header
        self.headerView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
        )
    }
    
    func sectionWillOpen(animated: Bool)
    {
        print("First Section Will Open")
        
        let duration = animated ? self.accordionController!.animationDuration : 0.0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations:
            {
                let h = self.headerView as! ALSingleLineHeaderView
                h.topSeparator.alpha = 0
        },
                       completion: nil)
    }
    
    func sectionWillClose(animated: Bool)
    {
        print("First Section Will Close")
        
        let duration = animated ? self.accordionController!.animationDuration : 0.0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations:
            {
                let h = self.headerView as! ALSingleLineHeaderView
                h.topSeparator.alpha = 1.0
        },
                       completion: nil)
    }
    
    //
    // MARK: - Gesture Recognizer
    //
    
    func headerTapped(_ recognizer: UITapGestureRecognizer)
    {
        // Get the section index for this view controller
        if let sectionIndex = self.accordionController?.sectionIndexForViewController(self)
        {
            print("First view controller header tapped")
            
            // If this section is open, close it - otherwise, open it
            if self.accordionController!.openSectionIndex == sectionIndex
            {
                self.accordionController?.closeSectionAtIndex(sectionIndex, animated: true)
            }
            else
            {
                self.accordionController?.openSectionAtIndex(sectionIndex, animated: true)
            }
        }
    }
    
    // MARK: - ALAccordionControllerDelegate
    
    // Required
    let headerView: UIView =
        {
            let header = ALSingleLineHeaderView()
            header.titleLabel.text = "Jobs"
            header.titleLabel.textColor = UIColor.black
            
            return header
    }()
    
}

class ContactCompanyViewController: UIViewController, ALAccordionSectionDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Add gesture recognizer to header
        self.headerView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
        )
    }
    
    func sectionWillOpen(animated: Bool)
    {
        print("First Section Will Open")
        
        let duration = animated ? self.accordionController!.animationDuration : 0.0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations:
            {
                let h = self.headerView as! ALSingleLineHeaderView
                h.topSeparator.alpha = 0
        },
                       completion: nil)
    }
    
    func sectionWillClose(animated: Bool)
    {
        let duration = animated ? self.accordionController!.animationDuration : 0.0
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations:
            {
                let h = self.headerView as! ALSingleLineHeaderView
                h.topSeparator.alpha = 1.0
        },
                       completion: nil)
    }
    
    //
    // MARK: - Gesture Recognizer
    //
    
    func headerTapped(_ recognizer: UITapGestureRecognizer)
    {
        // Get the section index for this view controller
        if let sectionIndex = self.accordionController?.sectionIndexForViewController(self)
        {
            
            // If this section is open, close it - otherwise, open it
            if self.accordionController!.openSectionIndex == sectionIndex
            {
                self.accordionController?.closeSectionAtIndex(sectionIndex, animated: true)
            }
            else
            {
                self.accordionController?.openSectionAtIndex(sectionIndex, animated: true)
            }
        }
    }
    
    // MARK: - ALAccordionControllerDelegate
    
    // Required
    let headerView: UIView =
        {
            let header = ALSingleLineHeaderView()
            header.titleLabel.text = "Contact"
            header.titleLabel.textColor = UIColor.black
            
            return header
    }()
}

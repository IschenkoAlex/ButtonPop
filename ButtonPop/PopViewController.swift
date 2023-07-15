//
//  PopViewController.swift
//  ButtonPop
//
//  Created by Alexander Ischenko on 14.07.2023.
//

import UIKit

class PopViewController: UIViewController {
    

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentControl()
    }
    
    @IBAction func closePopButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    private func setupSegmentControl() {
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentControl.widthAnchor.constraint(equalToConstant: view.bounds.width / 2).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        segmentControl.addTarget(self, action: #selector(changeSegmentValue(sender:)), for: .valueChanged)
     }
     @objc func changeSegmentValue(sender: UISegmentedControl) {
         switch sender.selectedSegmentIndex {
         case 0: preferredContentSize = CGSize(width: 300, height: 280)
         case 1: preferredContentSize = CGSize(width: 300, height: 150)
         default : break
         }
        
     }
   
}

//
//  ViewController.swift
//  ButtonPop
//
//  Created by Alexander Ischenko on 14.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var presentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        
    }
    private func setupGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        presentButton.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapped() {
        
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") else { return }
        
        popVC.modalPresentationStyle = .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.presentButton
        popOverVC?.sourceRect = CGRect(x: self.presentButton.bounds.midX, y: self.presentButton.bounds.maxY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 300, height: 280)
        
        self.present(popVC, animated: true)
    }
}

extension UIViewController : UIPopoverPresentationControllerDelegate {

    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
    }
}


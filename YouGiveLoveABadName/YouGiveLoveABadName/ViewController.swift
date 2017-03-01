//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bonJovi: UIImageView!
    var initialAnimate: Bool = false
    
    @IBOutlet weak var jonHeight: NSLayoutConstraint!


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
    }
    
    
    
    
    let gesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let duration = 1.0
        let frames = 3.0
        let relativeDuration = Double(duration/frames)
        if initialAnimate == false {
        animateBonJovi(duration: duration, relativeDuration: relativeDuration, frames: frames)
        } else {
//            deanimateBonJovi(duration: duration, relativeDuration: relativeDuration, frames: frames)
            bounce()
        }
}

}

    

extension ViewController {
    func animateBonJovi (duration: Double, relativeDuration: Double, frames:Double) {UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: .beginFromCurrentState, animations: {
        
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: relativeDuration, animations: {
        self.jonHeight.constant -= 75
        self.view.layoutIfNeeded()
        } )
        UIView.addKeyframe(withRelativeStartTime: Double(1/frames), relativeDuration: relativeDuration, animations: {
            self.jonHeight.constant = UIScreen.main.bounds.height + 75
            self.view.layoutIfNeeded()
            
        })
        UIView.addKeyframe(withRelativeStartTime: Double(2/frames), relativeDuration: relativeDuration, animations: {
            self.jonHeight.constant = UIScreen.main.bounds.height
            self.view.layoutIfNeeded()
        })
        
    }, completion: {complete in
        self.initialAnimate = true
        print(self.initialAnimate)} )}
    
    func deanimateBonJovi (duration: Double, relativeDuration: Double, frames:Double) {
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: [.beginFromCurrentState,.calculationModeLinear ], animations: {
        
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: relativeDuration, animations: {
            self.jonHeight.constant += 50
            self.view.layoutIfNeeded()
        })
        UIView.addKeyframe(withRelativeStartTime: Double(1/frames), relativeDuration: relativeDuration, animations: {
            self.jonHeight.constant = 270
            self.view.layoutIfNeeded()

        } )
        
        UIView.addKeyframe(withRelativeStartTime: Double(2/frames), relativeDuration: relativeDuration, animations: {
            self.jonHeight.constant = 310
            self.view.layoutIfNeeded()

        } )
        
        
    }, completion: {complete in
        self.initialAnimate = false
        print(self.initialAnimate)} )}
    
    func bounce() {
        UIView.animate(withDuration: 3.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: -10.0, options: [.beginFromCurrentState, .curveEaseInOut], animations: { self.jonHeight.constant = 310
        self.view.layoutIfNeeded()} , completion: { complete in
            self.initialAnimate = false})
        
    }
    
    }




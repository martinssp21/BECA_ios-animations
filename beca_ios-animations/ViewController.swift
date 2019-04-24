//
//  ViewController.swift
//  beca_ios-animations
//
//  Created by Rodrigo Martins on 04/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewDeFora: UIView!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var boxHeigthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var customButton: UIButton!
    
    @IBOutlet weak var loadViewDeFora: UIView!
    @IBOutlet weak var loadViewDeDentro: UIView!
    
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boxView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:))))
        
        boxView.layer.cornerRadius = 5
        customButton.layer.cornerRadius = 10
        
        loadViewDeFora.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loadingView(_ : ))))
    }
    
    @objc func loadingView(_ gesture: UITapGestureRecognizer?){
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseIn], animations: {
            self.loadViewDeDentro.frame = CGRect(x: 0, y: 0, width: self.loadViewDeFora.frame.size.width, height: 15)
        }) { (finished) in
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseOut], animations: {
                self.loadViewDeDentro.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: 30, height: 15)
            }, completion: {(finished) in
                self.loadViewDeDentro.frame = CGRect(x: -100, y: 0, width: 0, height: 15)
                self.loadingView(nil)
            })
        }
    }

    @objc func handleTap(gesture: UITapGestureRecognizer){
        
        self.isExpanded = isExpanded ? false : true
        let height: CGFloat = isExpanded ? 200 : 50
        
        UIView.animate(withDuration: 0.5) {
            self.boxHeigthConstraint.constant = height
            self.viewDeFora.layoutIfNeeded()
        }
        
        
    }

    @IBAction func didTapButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.customButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }) { (finished) in
            UIView.animate(withDuration: 0.2, animations: {
                self.customButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
}


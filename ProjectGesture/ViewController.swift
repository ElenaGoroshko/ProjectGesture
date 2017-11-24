//
//  ViewController.swift
//  ProjectGesture
//
//  Created by Elena Goroshko on 11/24/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var ibView: UIView!
    @IBOutlet private var parentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchRecognizer(_ :)))
        ibView.addGestureRecognizer(pinchGesture)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panRecognizer(_:)))
        ibView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapRecognizer(_:)))
        parentView.addGestureRecognizer(tapGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationRecognizer(_:)))
        ibView.addGestureRecognizer(rotationGesture)
    }
    
    // MARK: Gesture methods
    
    @objc func tapRecognizer(_ sender: UITapGestureRecognizer) {
        let rgbArray = Helpers.generateRandomArray(quantity: 3)
        let randomColor = UIColor(displayP3Red: rgbArray[0] / 256,
                                  green: rgbArray[1] / 256,
                                  blue: rgbArray[2] / 256, alpha: 1.0)
        ibView.backgroundColor = randomColor
    }

    @objc func pinchRecognizer(_ sender: UIPinchGestureRecognizer) {
        guard let transformedView = sender.view else { return }
        transformedView.transform = transformedView.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }

    @objc func panRecognizer(_ sender: UIPanGestureRecognizer) {
        let point = sender.location(in: parentView)
        ibView.center = point
    }

    @objc func rotationRecognizer(_ sender: UIRotationGestureRecognizer) {
        guard let transformedView = sender.view else { return }
        transformedView.transform = transformedView.transform.rotated(by: (sender.rotation * 3.14 / 180))
    }
}

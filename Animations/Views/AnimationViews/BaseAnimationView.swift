//
//  BaseAnimationView.swift
//  Animations
//
//  Created by Max on 21/10/2021.
//

import UIKit

protocol AnimationView {
    func startAnimating()
    func setupUI()
}

class BaseAnimationView: UIView, AnimationView {

    let blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let redSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func startAnimating() {
        UIView.animateKeyframes(withDuration: 0.5,
                                delay: 0,
                                options: []) {
            self.redSquare.center.y -= self.frame.height/2
        } completion: { (completed) in
            if completed {
                self.redSquare.center.y += self.frame.height/2
            }
        }
    }
    
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(blueSquare)
        addSubview(redSquare)
        
        NSLayoutConstraint.activate([
            blueSquare.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            blueSquare.heightAnchor.constraint(equalTo: blueSquare.widthAnchor),
            blueSquare.centerXAnchor.constraint(equalTo: centerXAnchor),
            blueSquare.topAnchor.constraint(equalTo: topAnchor),
            
            redSquare.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            redSquare.heightAnchor.constraint(equalTo: redSquare.widthAnchor),
            redSquare.centerXAnchor.constraint(equalTo: centerXAnchor),
            redSquare.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

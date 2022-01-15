//
//  SpringAnimationView.swift
//  Animations
//
//  Created by Max on 25/10/2021.
//

import UIKit

class SpringAnimationView: BaseAnimationView {

    override func startAnimating() {
        UIView.animate(withDuration: 1,
                                delay: 0,
                                usingSpringWithDamping: 0.4,
                                initialSpringVelocity: 0.0,
                                options: []) {
            self.redSquare.center.y += self.frame.height/1.5
        } completion: { (completed) in
            if completed {
                self.redSquare.center.y -= self.frame.height/1.5
            }
        }
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            blueSquare.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            blueSquare.heightAnchor.constraint(equalTo: blueSquare.widthAnchor),
            blueSquare.centerXAnchor.constraint(equalTo: centerXAnchor),
            blueSquare.topAnchor.constraint(equalTo: topAnchor),
            
            redSquare.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            redSquare.heightAnchor.constraint(equalTo: redSquare.widthAnchor),
            redSquare.centerXAnchor.constraint(equalTo: centerXAnchor),
            redSquare.centerYAnchor.constraint(equalTo: blueSquare.centerYAnchor)
        ])
    }

}

//
//  AnimationCell.swift
//  Animations
//
//  Created by Max on 21/10/2021.
//

import UIKit

class AnimationCell: UICollectionViewCell {
    @IBOutlet weak var animationName: UILabel!
    @IBOutlet weak var startAnimationButton: UIButton!
    
    var animationView: BaseAnimationView?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        animationName.text = ""
    }
    
    func setupCell(animation: AnimationViewModel) {
        animationName.text = animation.name
        animationView = animation.view
        guard let animationView = animationView else { return }
        
        addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.normalPadding),
            animationView.leftAnchor.constraint(equalTo: leftAnchor),
            animationView.rightAnchor.constraint(equalTo: rightAnchor),
            animationView.bottomAnchor.constraint(equalTo: animationName.topAnchor, constant: -Constants.smallPadding)
        ])
        animationView.setupUI()
    }
    
    @IBAction func startAnimation(_ sender: Any) {
        animationView?.startAnimating()
    }
}

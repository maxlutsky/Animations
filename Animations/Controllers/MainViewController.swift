//
//  ViewController.swift
//  Animations
//
//  Created by Max on 21/10/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var animationsCollectionView: UICollectionView!
    
    var animationViews: [AnimationViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationsCollectionView.dataSource = self
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: Constants.normalPadding,
                                           left: Constants.smallPadding,
                                           bottom: Constants.smallPadding,
                                           right: Constants.smallPadding)
        layout.itemSize = CGSize(width: Constants.animationCellWidth, height: Constants.animationCellHeight)
        animationsCollectionView.collectionViewLayout = layout
        populateAnimationViews()
        animationsCollectionView.reloadData()
    }
    
    func populateAnimationViews() {
        animationViews.append(AnimationViewModel(name: "Move Animation", view: BaseAnimationView()))
        animationViews.append(AnimationViewModel(name: "Spring Animation", view: SpringAnimationView()))
    }


}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        animationViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.animationCell, for: indexPath) as? AnimationCell else { return UICollectionViewCell() }
        cell.setupCell(animation: animationViews[indexPath.row])
        return cell
    }
}




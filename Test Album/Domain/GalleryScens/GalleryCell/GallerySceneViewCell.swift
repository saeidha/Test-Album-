//
//  GallerySceneViewCell.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

class GallerySceneViewCell: UICollectionViewCell {
    
    // MARK: - Public Property
    
    // MARK: - Private Property
    fileprivate lazy var image: UIImageView = {
     return UIImageView()
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.setCornerRadiusAndBoarder(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods

    // MARK: - Private Methods
    /// Setup UI Views
    fileprivate func setupViews() {
        self.addSubview(self.image)
        
        // Add Constraints
        self.image.translatesAutoresizingMaskIntoConstraints = false
        self.image.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.image.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.image.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.image.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}

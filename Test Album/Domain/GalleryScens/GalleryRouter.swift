//
//  GalleryRouter.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

final class GalleryViewController: UIViewController{
    
    // MARK: - Public Property
    
    // MARK: - Private Property
    
    fileprivate lazy var loader: UIActivityIndicatorView = {
        return UIActivityIndicatorView()
    }()
    
    fileprivate lazy var galleryCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        return collection
    }()
    fileprivate let refreshControl = UIRefreshControl()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.title = "Gallery"
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(image: .init(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(reload))
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    // MARK: - Public Method
    
    /// reload Collections
    @objc func refresh(){
    }
    
    /// reload Collections
    @objc func reload(){
        
    }
    // MARK: - Private Method
    
    /// Setup UI Views
    fileprivate func setupViews(){
        
        self.loader.color = .black
        self.galleryCollectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(self.galleryCollectionView)
        self.view.addSubview(self.loader)
        self.galleryCollectionView.addSubview(refreshControl)
        
        // Add Constraints
        self.galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.galleryCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.galleryCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.galleryCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.galleryCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        self.loader.translatesAutoresizingMaskIntoConstraints = false
        self.loader.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.loader.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loader.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.loader.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
   
}

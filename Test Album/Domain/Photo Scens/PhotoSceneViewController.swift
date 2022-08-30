//
//  PhotoSceneViewController.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit
protocol PhotoSceneInput: AnyObject
{
    /// Set title
    func fetchTitle(title: String)
    /// Successfull Fetch Photo
    func successFetchedPhoto(image: UIImage)
    /// Fail Fetch Photo
    func errorFetchingPhoto(error: String)
}
    
final class PhotoSceneViewController: UIViewController{
    
    // MARK: - Public Property
    var interactor: PhotoBusinessLogic?
    var router: PhotoSceneRouter?
    
    // MARK: - Private Property
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        let tapedTranscationView = UITapGestureRecognizer(target: self, action: #selector(_handleTapedTranscation))
        imageView.addGestureRecognizer(tapedTranscationView)
        return imageView
    }()
    fileprivate lazy var loader: UIActivityIndicatorView = {
        return UIActivityIndicatorView()
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupViews()
        interactor?.setTitle()
        self.loader.startAnimating()
        interactor?.showPhoto()
    }
    
    // MARK: - Private Methods
    /// Setup UI Views
    fileprivate func setupViews(){
        
        self.loader.color = .black
        self.imageView.backgroundColor = .clear
        self.imageView.contentMode = .scaleAspectFit
        self.view.addSubviews(self.imageView, self.loader)
        
        // Add Constraints
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        self.loader.translatesAutoresizingMaskIntoConstraints = false
        self.loader.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.loader.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loader.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.loader.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Public Methods
    /// Reload photo
    func reload(){
        DispatchQueue.main.async {
            self.loader.startAnimating()
            self.interactor?.reloadPhoto()
        }
    }
    
    /// Handle hide navigation bar by tap
    @objc func _handleTapedTranscation(){
        self.navigationController?.setNavigationBarHidden(navigationController?.isNavigationBarHidden == false, animated: true)
    }
    
}

extension PhotoSceneViewController: PhotoSceneInput{
    
    // MARK: - PhotoScene inputs
    
    func fetchTitle(title: String) {
        self.title = title
    }
    /// Successfull Fetch Photo set image
    func successFetchedPhoto(image: UIImage) {
        self.loader.stopAnimating()
        self.imageView.image = image
    }
    /// Fail image loading and show try again condition
    func errorFetchingPhoto(error: String) {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.router?.showLoadFailure(message: error)
        }
    }
    
    
}

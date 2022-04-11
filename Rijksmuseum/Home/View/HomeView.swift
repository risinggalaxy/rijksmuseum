//
//  HomeView.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class HomeView: UIViewController, HomeViewInterface {
    
    var presenter: HomePresenterInterface?
    private static let screenSize = UIScreen.main.bounds
    private static let cellScale: CGFloat = 0.8
    private let cellIdentifier: String = "cell"
    let errorLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: .zero, size: .zero))
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.isHidden = true
        return label
    }()
    
    var collectionView: UICollectionView! = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: screenSize,
                                              collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionViewLayout.scrollDirection = .horizontal
        return collectionView
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let av = UIActivityIndicatorView(style: .large)
        return av
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.addSubview(collectionView)
        setupCollectionView()
        
    }
    
    func moreInfoButtonAction(with object: ObjectModel) {
        presenter?.presentDetailsView(with: object, on: self)
    }
    
    func updateUISomethingWentWrong(with text: String) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.collectionView.isHidden = true
            strongSelf.view.addSubview(strongSelf.errorLabel)
            strongSelf.errorLabel.text = text
            strongSelf.errorLabel.isHidden = false
            strongSelf.errorLabel.centerAlignObject(strongSelf.view)
        }
    }
    
}


extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellSize = view.frame.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let cellIndex = (offset.x + scrollView.contentInset.left) / cellSize
        let roundedCellIndex = round(cellIndex)
        offset = CGPoint(x: roundedCellIndex * cellSize - scrollView.contentInset.left,
                         y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if presenter?.numberOfArtObjects != nil {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            return (presenter?.numberOfArtObjects)!
        } else {
            collectionView.addSubview(activityIndicator)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            activityIndicator.centerAlignObject(collectionView)
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        if cell.tag != indexPath.row {
            cell.imageView.image = nil
        }
        cell.tag = indexPath.row
        cell.isLoadingObject = true
        if let object = presenter?.objectFor(indexPath.row) {
            cell.model = object
            presenter?.imageForCell(with: object.webImage.url, name: object.id, and: .shared, completion: { (imageData) in
                DispatchQueue.main.async {
                    cell.mainImage = imageData
                    cell.isLoadingObject = false
                }
            })
            cell.moreInfoButtonClosure = { [weak self] in
                if let strongSelf = self {
                    strongSelf.moreInfoButtonAction(with: object)
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

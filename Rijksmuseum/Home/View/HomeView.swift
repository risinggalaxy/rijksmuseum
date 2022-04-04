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
    var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: screenSize,
                                              collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionViewLayout.scrollDirection = .horizontal
        return collectionView
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
        collectionView.isHidden = true
        view.addSubview(errorLabel)
        errorLabel.text = text
        errorLabel.isHidden = false
        errorLabel.centerAlignObject(view)
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
            return (presenter?.numberOfArtObjects)!
        } else {
            return .zero
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        if let object = presenter?.objectFor(indexPath.row) {
            cell.model = object
            cell.tag = indexPath.row
            cell.isLoadingObject = false
            presenter?.imageForCell(with: object.webImage.url, completion: { (imageData) in
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

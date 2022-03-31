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
    private static let cellScale: CGFloat = 0.5
    private let cellIdentifier: String = "cell"
    
    var object: [ObjectModel] = [ObjectModel(id: "Test", objectNumber: "test", title: "Test Object",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage"))]
    
    var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: screenSize,
                                              collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionViewLayout.scrollDirection = .horizontal
        let cellSize = CGSize(width: floor(screenSize.width * cellScale),
                              height: floor(screenSize.height * cellScale))
        let xInset = (screenSize.width - cellSize.width) / 2.0
        let yInset = (screenSize.height - cellSize.height) / 2.0
        collectionViewLayout.itemSize = cellSize
        collectionView.contentInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemIndigo
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.addSubview(collectionView)
        setupCollectionView()
    }
    
    
    
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func setupCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellSize = layout.itemSize.width + layout.minimumLineSpacing
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
        return object.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        cell.configureCell(model: object[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

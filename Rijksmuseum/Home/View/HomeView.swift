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
    private let headerIdentifier: String = "header"
    
    var object: [ObjectModel] = [ObjectModel(id: "Test", objectNumber: "test", title: "Test Object One",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Two",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Three",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Four",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Five",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Six",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Seven",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage")),
                                 ObjectModel(id: "Test", objectNumber: "test", title: "Test Object Eight",
                                             longTitle: "TEst", hasImage: true, principalOrFirstMaker: "Yasser Farahi", showImage: true,
                                             webImage: WebImageModel(url: "webImage"),
                                             headerImage: HeaderImageModel(url: "headerImage"))]
    
    var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: screenSize,
                                              collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionViewLayout.scrollDirection = .horizontal
//        let cellSize = CGSize(width: floor((screenSize.width * cellScale) + 50.0),
//                              height: floor((screenSize.height / 1.2) * cellScale))
//        let xInset = (screenSize.width - cellSize.width) / 2.0
//        let yInset = (screenSize.height - cellSize.height) / 2.0
//        collectionViewLayout.itemSize = cellSize
//        collectionView.contentInset = UIEdgeInsets(top: .zero, left: xInset, bottom: .zero, right: xInset)
//        collectionViewLayout.minimumLineSpacing = xInset
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.addSubview(collectionView)
        setupCollectionView()

    }

}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private func setupCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                withReuseIdentifier: headerIdentifier)
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
        return object.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        cell.model = object[indexPath.row]
        cell.moreInfoButtonClosure = {
            print(self.object[indexPath.row].title)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.title = object[indexPath.row].title
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
//        return header
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 150)
//    }
}

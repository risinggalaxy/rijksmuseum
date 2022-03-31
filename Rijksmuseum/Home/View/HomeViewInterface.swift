//
//  HomeViewInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

protocol HomeViewInterface {
    
    var presenter: HomePresenterInterface? { get set }
    var collectionView: UICollectionView { get }
    
}

//
//  HomeViewInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

protocol HomeViewInterface {
    
    var presenter: HomePresenterInterface? { get set }
    func moreInfoButtonAction(with object: ObjectModel)
    func updateUISomethingWentWrong( with text: String )
    var collectionView: UICollectionView! { get }
}

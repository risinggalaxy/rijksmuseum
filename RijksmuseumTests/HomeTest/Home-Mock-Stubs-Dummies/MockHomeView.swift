//
//  MockHomeView.swift
//  RijksmuseumTests
//
//  Created by YASSER FARAHI on 31/03/2022.
//

@testable import Rijksmuseum
import UIKit

class MockHomeView: HomeViewInterface {
    
    var collectionView: UICollectionView!
    var presenter: HomePresenterInterface?
    var didReceiveButtonAction: Bool = false
    var numbersButtonActionWasReceived: Int = 0
    
    func moreInfoButtonAction(with object: ObjectModel) {
        didReceiveButtonAction = true
        numbersButtonActionWasReceived += 1
    }
    
    func updateUISomethingWentWrong(with text: String) {
    }
    
    
}

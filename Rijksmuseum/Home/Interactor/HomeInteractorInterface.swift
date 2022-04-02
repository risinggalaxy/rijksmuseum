//
//  HomeInteractorInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

protocol HomeInteractorInterface {
    var presenter: HomePresenterInterface? { get set }
    var artObject: [ObjectModel]? { get }
    func objectFor( _ index: Int ) -> ObjectModel
}

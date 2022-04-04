//
//  DetailsPresenterInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

protocol DetailsPresenterInterface {
    var view: DetailsViewInterface? { get set }
    var interactor: DetailsInteractorInterface? { get set }
    var wireframe: DetailsWireframeInterface? { get set }
    var downloadService: DownloadService? { get set }
    var headerImage: Data? { get set }
    func updateDetailsView(with object: ObjectModel)
    func displayErrorLabel(with error: String )
}

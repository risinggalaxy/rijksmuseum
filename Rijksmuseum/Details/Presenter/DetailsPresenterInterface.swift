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
    func updateDetailsView(with object: ObjectModel)
    func displayErrorLabel(with error: String )
    func updateHeaderImage(for name: String, and url: String, with urlSession: URLSession) 
}

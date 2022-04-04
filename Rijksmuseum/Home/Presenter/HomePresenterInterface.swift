//
//  HomePresenterInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

protocol HomePresenterInterface {
    var view: HomeViewInterface? { get set }
    var interactor: HomeInteractorInterface? { get set }
    var wireframe: HomeWireframeInterface? { get set }
    var downloadService: DownloadService? { get set }
    func objectFor( _ index: Int ) -> ObjectModel
    func presentDetailsView(with object: ObjectModel, on view: VIEW)
    var numberOfArtObjects: Int? { get set }
    func somethingWentWrong( _ error: String)
    func imageForCell(with url: String?, completion: @escaping (Data) -> Void )
}

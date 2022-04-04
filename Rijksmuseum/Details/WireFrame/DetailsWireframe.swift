//
//  DetailsWireframe.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class DetailsWireframe: DetailsWireframeInterface {
    
    static func makeDetailsView(with object: ObjectModel ) -> VIEW {
        let view = DetailsView()
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter()
        let wireframe = DetailsWireframe()
        let downloadService = DownloadService(urlString: object.headerImage.url)
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.object = object
        presenter.downloadService = downloadService
        return view
    }
    
}

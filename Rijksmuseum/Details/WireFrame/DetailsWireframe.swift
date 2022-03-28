//
//  DetailsWireframe.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class DetailWireframe: DetailWireframeInterface {
    
    static func makeDetailsView() -> VIEW {
        let view = DetailView()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let wireframe = DetailWireframe()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        return view
    }
    
}

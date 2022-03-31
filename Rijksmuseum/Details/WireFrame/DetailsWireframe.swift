//
//  DetailsWireframe.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class DetailsWireframe: DetailsWireframeInterface {
    
    static func makeDetailsView() -> VIEW {
        let view = DetailsView()
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter()
        let wireframe = DetailsWireframe()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        return view
    }
    
}

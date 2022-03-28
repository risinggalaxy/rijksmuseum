//
//  HomeWireframe.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class HomeWireframe: HomeWireframeInterface {
    
    static func makeHomeView() -> VIEW {
        let view = HomeView()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let wireframe = HomeWireframe()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        
        return view
    }
    
}

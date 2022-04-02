//
//  HomePresenter.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class HomePresenter: HomePresenterInterface {
    var view: HomeViewInterface?
    var interactor: HomeInteractorInterface?
    var wireframe: HomeWireframeInterface?
    
    var numberOfArtObjects: Int? 
    
    func objectFor( _ index: Int ) -> ObjectModel {
        guard let object = interactor?.objectFor(index) else {
            somethingWentWrong()
            return dummyObjects[0]
        }
        return object
    }
    
    func presentDetailsView(with object: ObjectModel, on view: VIEW) {
        wireframe?.presentDetailsView(with: object, on: view)
    }
    
    func somethingWentWrong() {
        print("Got your message")
        view?.updateUISomethingWentWrong(with: ErrorHandler.failedRequest(description: "Something Went Wrong!").localizedDescription)
    }
}

//
//  HomeView.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class HomeView: UIViewController, HomeViewInterface {
    
    var presenter: HomePresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemIndigo
    }
    
    
}

//
//  DetailsView.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class DetailsView: UIViewController, DetailsViewInterface {
    
    var presenter: DetailsPresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    
}

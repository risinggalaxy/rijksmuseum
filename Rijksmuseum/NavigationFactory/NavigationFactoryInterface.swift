//
//  NavigationFactoryInterface.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 01/04/2022.
//

import UIKit

protocol NavigationFactoryInterface {
    static func factory(rootView: UIViewController, showNavigationBar: Bool, largeTitle: Bool) -> UINavigationController
}

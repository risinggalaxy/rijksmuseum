//
//  NavigationFactory.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 01/04/2022.
//

import UIKit

class NavigationFactory: NavigationFactoryInterface {
    static func factory(rootView: UIViewController, showNavigationBar: Bool, largeTitle: Bool) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.prefersLargeTitles = largeTitle
        if #available(iOS 15.0, *), showNavigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().standardAppearance = appearance
        }
        return navigationController
    }
}

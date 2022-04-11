//
//  SceneDelegate.swift
//  Rijksmuseum
//
//  Created by YASSER FARAHI on 28/03/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let uiWindow = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: uiWindow)
        window?.rootViewController = HomeWireframe.makeHomeView()
        window?.makeKeyAndVisible()
    }

}

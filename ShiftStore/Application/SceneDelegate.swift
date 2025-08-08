//
//  SceneDelegate.swift
//  ShiftStore
//
//  Created by S&Q on 04.08.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  let container = DIContainer.shared

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    self.window = UIWindow(windowScene: scene)
    
    if UserDefaults.standard.bool(forKey: "isUserLoggedIn") {
      let mainVC = MainViewController(services: container)
      self.window?.rootViewController = UINavigationController(rootViewController: mainVC)
    } else {
        let registrVC = RegisterViewController(services: container)
      self.window?.rootViewController = UINavigationController(rootViewController: registrVC)
    }
    
    self.window?.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) {

  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    
  }

  func sceneWillResignActive(_ scene: UIScene) {
    
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
  
  }

}


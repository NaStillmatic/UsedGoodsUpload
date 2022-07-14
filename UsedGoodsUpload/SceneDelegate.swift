//
//  SceneDelegate.swift
//  UsedGoodsUpload
//
//  Created by HwangByungJo  on 2022/07/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  
  let rootViewModel = MainViewModel()


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    let rootViewController = MainViewController()
    rootViewController.bind(rootViewModel)
    window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    window?.makeKeyAndVisible()
  }
}


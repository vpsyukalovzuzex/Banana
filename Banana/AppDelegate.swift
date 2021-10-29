//
// AppDelegate.swift
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.backgroundColor = .white
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = construct().viewController
        window?.makeKeyAndVisible()
        return true
    }
    
    // TODO: - Better solution is using DI or add this constructor to my VIPER module template.
    func construct() -> MainRouter {
        let view = MainView()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
}

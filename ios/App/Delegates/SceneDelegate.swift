import Turbo
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private lazy var navigator = TurboNavigator(pathConfiguration: pathConfiguration)
    private let pathConfiguration = PathConfiguration(sources: [
        .server(Endpoint.pathConfigurationURL)
    ])

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        UINavigationBar.configureWithOpaqueBackground()
        window?.rootViewController = navigator.rootViewController
        navigator.route(Endpoint.rootURL)
    }
}

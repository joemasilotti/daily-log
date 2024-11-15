import HotwireNative
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private lazy var navigator = Navigator(pathConfiguration: pathConfiguration)
    private let pathConfiguration = PathConfiguration(sources: [
        .server(Endpoint.pathConfigurationURL)
    ])

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        UINavigationBar.configureWithOpaqueBackground()

        Hotwire.registerBridgeComponents(BridgeComponent.allTypes)

        window?.rootViewController = navigator.rootViewController
        navigator.route(Endpoint.rootURL)
    }
}

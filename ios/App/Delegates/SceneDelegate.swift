import Turbo
import UIKit

let rootURL = URL(string: "http://localhost:3000")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private lazy var navigator = TurboNavigator(pathConfiguration: pathConfiguration)
    private let pathConfiguration = PathConfiguration(sources: [
        .server(rootURL.appending(path: "configurations/ios.json"))
    ])

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        UINavigationBar.configureWithOpaqueBackground()
        window?.rootViewController = navigator.rootViewController
        navigator.route(rootURL)
    }
}

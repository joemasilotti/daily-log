import Turbo
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private lazy var navigator = TurboNavigator(pathConfiguration: pathConfiguration, delegate: self)
    private let pathConfiguration = PathConfiguration(sources: [
        .server(Endpoint.pathConfigurationURL)
    ])

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        UINavigationBar.configureWithOpaqueBackground()
        Turbo.configureStrada()

        window?.rootViewController = navigator.rootViewController
        navigator.route(Endpoint.rootURL)
    }
}

extension SceneDelegate: TurboNavigatorDelegate {
    func handle(proposal: VisitProposal) -> ProposalResult {
        .acceptCustom(WebViewController(url: proposal.url))
    }
}

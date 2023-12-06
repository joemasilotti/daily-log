import UIKit

extension UINavigationBar {
    static func configureWithOpaqueBackground() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}

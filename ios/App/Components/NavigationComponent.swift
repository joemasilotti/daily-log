import Strada
import UIKit

class NavigationComponent: BridgeComponent {
    override class var name: String { "navigation" }

    override func onReceive(message: Message) {
        guard let viewController else { return }

        if message.event == "previous" {
            addPreviousButton(to: viewController)
        } else if message.event == "next" {
            addNextButton(to: viewController)
        }
    }

    private var viewController: UIViewController? {
        delegate.destination as? UIViewController
    }

    private func addPreviousButton(to viewController: UIViewController) {
        let image = UIImage(systemName: "chevron.backward.circle")
        let action = UIAction { [unowned self] _ in
            self.reply(to: "previous")
        }
        viewController.navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: image, primaryAction: action)
    }

    private func addNextButton(to viewController: UIViewController) {
        let image = UIImage(systemName: "chevron.forward.circle")
        let action = UIAction { [unowned self] _ in
            self.reply(to: "next")
        }
        viewController.navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: image, primaryAction: action)
    }
}

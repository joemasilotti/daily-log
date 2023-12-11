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
        let image = UIImage(systemName: "chevron.forward.circle")
        let action = UIAction { [unowned self] _ in
            self.reply(to: "next")
        }
        let item = UIBarButtonItem(image: image, primaryAction: action)
        addBarButtonItem(item, to: viewController)
    }

    private func addNextButton(to viewController: UIViewController) {
        let image = UIImage(systemName: "chevron.backward.circle")
        let action = UIAction { [unowned self] _ in
            self.reply(to: "previous")
        }
        let item = UIBarButtonItem(image: image, primaryAction: action)
        addBarButtonItem(item, to: viewController)
    }

    private func addBarButtonItem(_ item: UIBarButtonItem, to viewController: UIViewController) {
        var items = viewController.navigationItem.rightBarButtonItems ?? [UIBarButtonItem]()
        guard items.count < 2 else { return }

        items.append(item)
        viewController.navigationItem.rightBarButtonItems = items
    }
}

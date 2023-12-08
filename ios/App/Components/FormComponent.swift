import Strada
import UIKit

final class FormComponent: BridgeComponent {
    override class var name: String { "form" }

    override func onReceive(message: Message) {
        guard let event = Event(rawValue: message.event) else { return }

        switch event {
        case .connect:
            handleConnectEvent(message: message)
        case .submitEnabled:
            enableButton()
        case .submitDisabled:
            disableButton()
        }
    }

    private weak var button: UIBarButtonItem?
    private var viewController: UIViewController? {
        delegate.destination as? UIViewController
    }

    private func handleConnectEvent(message: Message) {
        guard let data: MessageData = message.data() else { return }
        configureButton(with: data.submitTitle)
    }

    private func enableButton() {
        button?.isEnabled = true
    }

    private func disableButton() {
        button?.isEnabled = false
    }

    private func configureButton(with title: String) {
        guard let viewController else { return }

        let action = UIAction(title: title) { [unowned self] _ in
            self.reply(to: Event.connect.rawValue)
        }

        let button = UIBarButtonItem(primaryAction: action)
        viewController.navigationItem.rightBarButtonItem = button
        self.button = button
    }
}

private extension FormComponent {
    enum Event: String {
        case connect
        case submitEnabled
        case submitDisabled
    }
}

private extension FormComponent {
    struct MessageData: Decodable {
        let submitTitle: String
    }
}

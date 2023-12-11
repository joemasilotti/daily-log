import Strada

extension BridgeComponent {
    static var allTypes: [BridgeComponent.Type] {
        [
            ButtonComponent.self,
            FormComponent.self,
            NavigationComponent.self
        ]
    }
}

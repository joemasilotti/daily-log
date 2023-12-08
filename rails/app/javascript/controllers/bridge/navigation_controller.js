import { BridgeComponent, BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "navigation"
  static targets = ["previous", "next"]

  connect() {
    super.connect()

    if (this.hasPreviousTarget) {
      this.send("previous", {}, () => {
        new BridgeElement(this.previousTarget).click()
      })
    }

    if (this.hasNextTarget) {
      this.send("next", {}, () => {
        new BridgeElement(this.nextTarget).click()
      })
    }
  }
}

import { BridgeComponent, BridgeElement } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "form"
  static targets = ["submit"]

  connect() {
    super.connect()
    this.notifyBridgeOfConnect()
  }

  notifyBridgeOfConnect() {
    const submitButton = new BridgeElement(this.submitTarget)
    const submitTitle = submitButton.bridgeAttribute("title") || submitButton.title

    this.send("connect", { submitTitle }, () => {
      this.submitTarget.click()
    })
  }

  submitStart(event) {
    this.submitTarget.disabled = true
    this.send("submitDisabled")
  }

  submitEnd(event) {
    this.submitTarget.disabled = false
    this.send("submitEnabled")
  }
}


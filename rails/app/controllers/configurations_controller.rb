class ConfigurationsController < ApplicationController
  def ios
    render json: {
      settings: {},
      rules: [
        {
          patterns: ["/new$"],
          properties: {
            context: "modal"
          }
        }
      ]
    }
  end
end

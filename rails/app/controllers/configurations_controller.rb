class ConfigurationsController < ApplicationController
  skip_before_action :authenticate_user!

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

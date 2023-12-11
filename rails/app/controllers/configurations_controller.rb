class ConfigurationsController < ApplicationController
  skip_before_action :authenticate_user!

  def ios
    render json: {
      settings: {},
      rules: [
        {
          patterns: ["/recede_historical_location"],
          properties: {
            presentation: "pop"
          }
        },
        {
          patterns: [
            "/new$",
            "/edit$",
            "/settings"
          ],
          properties: {
            context: "modal"
          }
        }
      ]
    }
  end
end

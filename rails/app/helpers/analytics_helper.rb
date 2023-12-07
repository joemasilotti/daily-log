module AnalyticsHelper
  def analytics_tag
    if (site_id = Rails.configuration.fathom)
      javascript_include_tag "https://cdn.usefathom.com/script.js",
        defer: true, data: {site: site_id}
    end
  end

  def track_page_view_script
    if Rails.configuration.fathom.present?
      javascript_tag do
        <<-JS.strip_heredoc.html_safe
          document.addEventListener("turbo:load", () => {
            if (window.fathom) {
              window.fathom.trackPageview()
            }
          })
        JS
      end
    end
  end
end

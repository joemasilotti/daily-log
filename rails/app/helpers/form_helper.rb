module FormHelper
  class StradaFormBuilder < ActionView::Helpers::FormBuilder
    def submit(value = nil, options = {})
      options[:data] ||= {}
      options["data-bridge--form-target"] = "submit"

      super(value, options)
    end
  end

  def strada_form_with(*, **options, &block)
    options[:html] ||= {}
    options[:html][:data] ||= {}
    options[:html][:data] = options[:html][:data].merge(strada_form_data(options))
    options[:builder] = StradaFormBuilder

    form_with(*, **options, &block)
  end

  private

  def strada_form_data(options)
    {
      controller: "#{options.dig(:data, :controller)} bridge--form",
      action: "turbo:submit-start->bridge--form#submitStart turbo:submit-end->bridge--form#submitEnd"
    }
  end
end

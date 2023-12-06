module TurboNativeHelper
  def page_title
    if turbo_native_app?
      content_for(:turbo_native_title) || content_for(:title) || "Daily Log"
    else
      content_for(:title) || "Daily Log"
    end
  end

  def platform_identifier
    "turbo-native" if turbo_native_app?
  end
end

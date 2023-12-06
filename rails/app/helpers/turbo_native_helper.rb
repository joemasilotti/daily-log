module TurboNativeHelper
  def platform_identifier
    "turbo-native" if turbo_native_app?
  end
end

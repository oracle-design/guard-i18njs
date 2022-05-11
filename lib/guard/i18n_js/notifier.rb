module Guard
  class I18nJs
    class Notifier
      class << self
        def guard_message(result, duration)
          case result
          when true
            format("locales exported with i18n-js.\nin %.1f seconds.", duration)
          else
            "locales can not exported with i18n-js,\nplease check."
          end
        end

        def guard_image(result)
          return :failed unless result

          :success
        end

        def notify(result, duration)
          message = guard_message(result, duration)
          image = guard_image(result)

          ::Guard::Notifier.notify(message, title: "I18n::JS export", image: image)
        end
      end
    end
  end
end

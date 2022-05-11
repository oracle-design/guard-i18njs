# frozen_string_literal: true

require_relative "i18njs/version"
require "guard/plugin"
require "i18n-js"

module Guard
  class I18njs < Plugin
    autoload :Notifier, "guard/i18njs/notifier"

    def start
      export_locales_to_i18n_js
    end

    def reload
      export_locales_to_i18n_js
    end

    def run_all
      true
    end

    def stop
      true
    end

    def run_on_additions(_paths = [])
      export_locales_to_i18n_js
    end

    def run_on_modifications(_paths = [])
      export_locales_to_i18n_js
    end

    def run_on_removals(_paths = [])
      export_locales_to_i18n_js
    end

    private

    def export_locales_to_i18n_js
      start_at = Time.now
      ::Guard::UI.info "Start exporting i18n-js...🌏", reset: true
      result = system %(bundle exec rake i18n:js:export)
      Notifier.notify(result, Time.now - start_at)

      result
    end
  end
end

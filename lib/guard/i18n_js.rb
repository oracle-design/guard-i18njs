# frozen_string_literal: true

require_relative "i18n_js/version"
require "guard"
require "i18n-js"

module Guard
  class I18nJs < Plugin
    autoload :Notifier, "guard/i18n-js/notifier"

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

    private

    def export_locales_to_i18n_js
      ::Guard::UI.info "Exporting i18n-js", reset: true

      system %(bundle exec rake i18n:js:export)
    end
  end
end

# frozen_string_literal: true

require_relative "lib/guard/i18njs/version"

Gem::Specification.new do |spec|
  spec.name = "guard-i18njs"
  spec.version = Guard::I18njsVersion::VERSION
  spec.authors = ["FunnyQ"]
  spec.email = ["funnyq@gmail.com"]

  spec.summary = "auto execute `rake i18n:js:export` when locales changed."
  spec.description = "auto execute `rake i18n:js:export` when locales changed."
  spec.homepage = "https://odd.tw"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://repos.odd.tw/"
  spec.metadata["changelog_uri"] = "https://repos.odd.tw/guard-i18njs/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "guard"
  spec.add_dependency "i18n-js"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

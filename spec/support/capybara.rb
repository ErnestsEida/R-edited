require "capybara/cuprite"

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app, window_size: [1200, 800], headless: !ENV.has_key?('SKIP_HEADLESS')
  )
end

Capybara.default_driver = :cuprite
Capybara.javascript_driver = :cuprite

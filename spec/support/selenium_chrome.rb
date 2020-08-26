require 'capybara/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

client = Selenium::WebDriver::Remote::Http::Default.new
client.read_timeout = 120

Capybara.register_driver :selenium_chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, http_client: client)
end

Capybara.javascript_driver = :selenium_chrome_headless

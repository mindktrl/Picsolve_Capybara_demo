module LoginPage

  def self.loggingdazn(browsertype,appURl)
    ##chrome profile
    if browsertype=="Chrome"
      BrowserProfiles.ChromeProfile
    end
    ##IE profile
    if browsertype=="IE"
      BrowserProfiles.IeProfile
    end
    ##FireFox profile
    if browsertype=="Firefox"
      BrowserProfiles.FirefoxProfile
    end
    Capybara.default_driver
    ##clear cookies
    Capybara.reset_sessions!
    sleep 10
    ##maximizing the browser
    page.driver.browser.manage.window.maximize
    #visiting browser
    visit "https://www.picsolve.com/#/dashboard"
  end
end




module BrowserProfiles
  ##IE profile
  def self.IeProfile
    Capybara.register_driver :selenium_IE do |app|
      $session_1=Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
    end
    return Capybara.default_driver=:selenium_IE
  end

  ##Chrome profile
  def self.ChromeProfile
    Capybara.register_driver :selenium_chrome do|app|
      prefs = {"download" => {"default_directory" => 'C:\Downloads'}}
      $session_1=Capybara::Selenium::Driver.new(app, :browser => :chrome, :prefs => prefs, :detach => :unspecified)
    end
    return Capybara.default_driver=:selenium_chrome
  end
  ##Firefox profile
  def self.FirefoxProfile
    Capybara.register_driver :selenium_firefox do|app|
      driver=Capybara::Selenium::Driver.new(app, :browser => :firefox)
    end
    return Capybara.default_driver=:selenium_firefox
  end
end
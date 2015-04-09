# Selenium---Test-Automation 

Setup and Configuration

Environment - MacOSX

	Homebrew - http://brew.sh/

		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	RVM / Ruby - https://rvm.io/rvm/install

		\curl -sSL https://get.rvm.io | bash -s stable --ruby
		source /etc/profile
		rvm use --default

	Ruby Gems

		Bundler - https://rubygems.org/gems/bundler

			gem install bundler

		Selenium - https://rubygems.org/gems/selenium-webdriver

			gem install selenium-webdriver

		Phantomjs - http://phantomjs.org/

			gem install phantomjs

			*In addition to installing the gem, download phantomjs from the site, unzip it and put the 'phantomjs' file in your /usr/bin folder

		Nokogiri - https://rubygems.org/gems/nokogiri

			gem install nokogiri

			*If you are using Appium on the same computer, you need to install a specific version of Nokogiri, else you will have a conflict

				gem install nokogiri -v 1.6.3.1

		RSpec - https://rubygems.org/gems/rspec

			gem install rspec

	ChromeDriver - https://code.google.com/p/selenium/wiki/ChromeDriver

		Download, unzip and put in your /usr/bin folder

	SafariDriver - https://lavanyaaraga.wordpress.com/2013/01/19/installation-steps-of-selenium-webdriver-in-mac-safari-browser/

		Follow the steps outlined on this site

	
	TBD below...

	Jenkins - http://jenkins-ci.org/

		Configure System

			Global properties - Environment variables - List of key-value pairs
				name = PATH
				value = /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

		Project Setup

			New Item
				Name it
				Check 'Freestype project'
			Configure
				Build
					Execute Shell
						Enter the commands you need to run your scripts




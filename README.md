
# BDD Testing App

## Overview

Automatic BDD testing tool for Com App.

## Requisites

* [Ruby 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/)
* [Chromedriver-helper](https://github.com/flavorjones/chromedriver-helper)

   Installs the appropiate chromedriver executable in your gem path.
* [Capybara](https://github.com/teamcapybara/capybara)

   Simulates how a real user would interact with the app.

* [Cucumber](https://github.com/cucumber/cucumber)

   Provides support for Behaviour-Driven Development. Executes specifications written using Gherkin syntax.

* [Site Prism](https://github.com/natritmeyer/site_prism)

   DSL describing a web application using Page Object Model pattern, for use with Capybara in automated acceptance testing.

* [Selenium Webdriver](https://github.com/SeleniumHQ/selenium)

   Makes direct calls to the browser using each browser’s native support for automation.

* [Require\_all](https://github.com/jarmo/require_all)

   Points to a directory and require all the requested files at once.

* Dotenv

* Minitest

* Rake


## Usage

The following rake task will execute the _user_login_ cucumber profile:

```bash
user@localhost:~/bdd_project$ rake user_login
```

## Setup

Create a copy of the file _env.sample_ and name it _.env_. Modify the environmental variables accordingly.

### Environmental variables

#### Mandatory
* APP_URL
* APP_USERNAME
* APP_PASSWORD

#### Optional

n/a

## Structure

The following tree represents the most important elements of this tool:
```bash
├── features
│   ├── pages
│   │   ├── sections/*.rb
│   │   └── *.rb
│   ├── step_definitions
│   │   └── *.rb
│   ├── support
│   │   ├── helpers/*.rb
│   │   └── env.rb
│   ├── *.feature
├── reports
├── .env
├── cucumber.yml
└── Rakefile
```

###  Features folder

  Cucumber requires step_definitions/ folder, support/ folder and support/env.rb in order to execute the tests.

* **Pages** folder : it will keep the page object models of our web application. Check out  [Site Prism](https://github.com/natritmeyer/site_prism) in order to start defining these models.

*  **Step_Definitions** folder: implementation details of the steps the tool automates; they are written using  [Ruby](https://ruby-doc.org/core-2.4.1/) & [Capybara](https://github.com/teamcapybara/capybara).

* **Support** folder: contains _env.rb_, which will set up the testing environment. Capybara configuration will be set here.

If you are curious (and feel intreped) you can verify how cucumber create this skeleton:

```bash
user@localhost:~/bdd_project$ cucumber --init
  create features
  create features/step_definitions
  create features/support
  create features/support/env.rb
```

  Please, **do not** do this on your current project unless you want to loose all your content.

####  Feature files

   They provide a high-level description of the software features under test. For a complete reference, check Cucumber's [Gherkin reference](https://docs.cucumber.io/gherkin/reference/). As an example:

```gherkin
Feature: User can deposit money on his bank account

  Scenario: User makes a deposit of 100$
    Given the user has a bank account with 0$
    When the user deposits 100$ on his account
    Then the new balance of his account is 100$
```

###  Report folder

_ToDo_

### Other files

#### .env
Enviromental variables used in the application
#### cucumber.yml
Contains cucumber profiles to be tested. The syntax is:

```ruby
<profile_name>: -f pretty -f html -o reports/<html_output_file>.html --tags <profile_tag>
```

<profile_name> will be used in Rakefile to invoke the desired profile. Each one can have a different configuration.

<profile_tag> is the tag name given in the feature file, so you can group different test under a common tag. It starts with _@_ (for example, _@user\_login_)

#### Rakefile

Describes which rake tasks are associated with the profiles previously defined on _cucumber.yml_ . For example:

```ruby
Cucumber::Rake::Task.new(:user_login) do |t|
  t.profile = 'all'
end
```

## Contact

You can reach the author on github or by email [carlos.agullo@gmail.com](mailto:carlos.agullo@gmail.com)

## License

_TBD_

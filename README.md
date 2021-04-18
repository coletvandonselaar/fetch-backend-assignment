# Ruby on Rails Setup

### Mac OS

1. Start by running `ruby --version` if you already have ruby 2.7 installed, skip ahead to Rails set up (4)
1. Start out by installing homebrew, if you have this installed skip this.
    1. First off, make sure you have the requirements
        * A 64-bit Intel CPU or Apple Silicon CPU
        * macOS Mojave (10.14) or higher
        * Command Line Tools (CLT) for Xcode which you can download by either
            1. `xcode-select --install`
            1. https://apps.apple.com/us/app/xcode/id497799835
            1. https://developer.apple.com/downloads
        * A Bourne-compatible shell for installation (e.g. bash or zsh)
    1. Run this in your terminal `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
    1. After completion run `brew update` to make sure everything is good.
    1. For more information https://brew.sh/
1. Next we are going to install & setup Ruby version manager rbenv
    1. Start out by running `brew install rbenv`
    1. Then run `brew upgrade rbenv ruby-build` to make sure everything is up to date
    1. Run `rbenv init` and follow instructions
    1. Afterwards, you will need fully close your terminal and open a new one to see the changes
    1. Verify rbenv works by running `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash`
        * It should return something like this: 
          ```
           Checking for `rbenv' in PATH: /usr/local/bin/rbenv
           Checking for rbenv shims in PATH: OK
           Checking `rbenv install' support: /usr/local/bin/rbenv-install (ruby-build 20170523)
           Counting installed Ruby versions: none
               There aren't any Ruby versions installed under `~/.rbenv/versions'.
               You can install Ruby versions like so: rbenv install 2.2.4
           Checking RubyGems settings: OK
           Auditing installed plugins: OK
          ```
        * If it does not - try restarting terminal and running again. If all else fails check official documentation. https://github.com/rbenv/rbenv
    1. That should be it, if any troubles check official documentation here: https://github.com/rbenv/rbenv
1. Now we can go ahead and install ruby with rbenv.
    1. Run `rbenv install 2.7.0`
1. Now, before we get started with Rails we will need to make sure we have the following dependencies
    * Node.js
    * Yarn
1. Next, let's make sure we have Node.js installed
    1. Start off by running `node --version`
        *. If it returns a version greater than 8.16.0 you're good
    1. If node is not installed, run `brew install node`. (this will install npm alongside)
1. Now we can install yarn
    1. Start off by running `yarn --version`
        * If it returns something like "1.22.0"
    1. If it does not return a value, run `npm install --global yarn`, then run `yarn --version` again
1. Now, if you haven't already pull down this repository and in the terminal come to the projects directory
1. Then run `gem install bundler`
1. After that, run `bundle install`, this will install all libraries and dependencies as defined in Gemfile and Gemfile.lock
1. If it succeeds, go down to "Running the application"


### Windows
1. Start by running `ruby --version` if you already have ruby 2.7 installed, skip ahead to Rails set up
1. We are going to use RubyInstaller to install Ruby for Windows
    1. Start by going here: https://rubyinstaller.org/downloads/
    1. Download Ruby+Devkit 2.7.2-1(x64)
    1. Open installer and follow on screen instructions (allow it install RIDK at the end)
    1. Afterwards, when running `ruby --version`, it should return "ruby 2.7.x"
1. Now, before we get started with Rails we will need to make sure we have the following dependencies
    * Node.js
    * Yarn
1. Let's start out by installing node
    1. Make sure you don't already have node already by running `node --version`
    1. If you don't already have node, go here: https://nodejs.org/en/download/ and click on the windows installer
    1. Follow on screen instructions
    1. I checked the "Automatically install the necessary tools..." checkbox. I'm not sure if this is a requirement
1. Now we can install yarn
    1. Start off by running `yarn --version`
        * If it returns something like "1.22.0"
    1. If it does not return a value, run `npm install --global yarn`, then run `yarn --version` again
1. Now, if you haven't already pull down this repository and in the terminal come to the projects directory
1. Then run `gem install bundler`
1. After that, run `bundle install`, this will install all libraries and dependencies as defined in Gemfile and Gemfile.lock
1. If it succeeds, go down to "Running the application"

## Linux (Ubuntu)
1. We are going to start out by downloading & setting up rbenv. This allows us to download ruby versions & also switch between them
    1. Start out by running `sudo apt install rbenv`
    1. Run `rbenv init` & follow on screen instructions
    1. Close & re-open terminal for changes to take place
    1. Then, we are going to add ruby-build as a plug-in ro rbenv so we can install different versions.
        1. Run `mkdir -p "$(rbenv root)"/plugins`
        1. Run `git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build`
    1. Verify that rbenv is properly set up by running `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash`
        * Should see something like 
        ```
       Checking for `rbenv' in PATH: /usr/local/bin/rbenv
       Checking for rbenv shims in PATH: OK
       Checking `rbenv install' support: /usr/local/bin/rbenv-install (ruby-build 20170523)
       Counting installed Ruby versions: none
         There aren't any Ruby versions installed under `~/.rbenv/versions'.
         You can install Ruby versions like so: rbenv install 2.2.4
       Checking RubyGems settings: OK
       Auditing installed plugins: OK
       ```
        * If it does not - try restarting terminal and running again. If all else fails check official documentation. https://github.com/rbenv/rbenv
1. Now we are going to install Ruby with rbenv
    1. Run `rbenv install -v '2.7.0'`
        * Note: This might take a few minutes to install.
1. Now before we start with Rails, we have to install two dependencies
     * Node.js
     * Yarn
 1. Let's start with node & npm
    1. Run `sudo apt install nodejs`
    1. Run `sudo apt install npm`
    1. To confirm installations run `nodejs -v` & `npm -v`
1. Now let's install `yarn`
    1. Run `npm install --global yarn`
        * Note: There is a chance you might have to use `sudo` for this to work
    1. Then run `yarn -v`
1. Now, if you haven't already pull down this repository and in the terminal come to the projects directory
1. Then run `gem install bundler`
1. After that, run `bundle install`, this will install all libraries and dependencies as defined in Gemfile and Gemfile.lock
1. If it succeeds, go down to "Running the application"    

# Running the application
1. First we want to create the database. Do this by running `bundle exec rails db:create db:migrate`
1. After this, you should be able to run `bundle exec rails s` and that'll start the server! 
1. Note: If at any time you want to clear the database and start over. You can stop the server by pressing `ctrl+c`, then run `bundle exec rails db:drop db:create db:migrate`, this will drop then re-create the Database. then run the server again with `bundle exec rails s`
    * If that gives you any errors, you can run a rails console by `bundle exec rails c` and destroying all `transactions` with `Transaction.destroy_all`

# Using the API


### Create
To create a new transaction, make a `post` request to `/transactions` route with the following parameters

Parameter | Type | Required | Notes
--------- | ---- | -------- | ----- 
Payer | String | true | Will be converted to fully uppercase
Points | Integer | true | none
Timestamp | Datetime | true | none

Example: `/transactions?payer=Walmart&points=500&timestamp=2021-02-02T11:00:00.000Z` will return 
```json
{
    "id": "<id>",
    "payer": "WALMART",
    "points": 500,
    "timestamp": "2021-02-02T11:00:00.000Z"
}
```

### Spending points
To spend points, send a `post` request to `/transactions/spend` with the following parameters

Parameter | Type | Required | Notes
--------- | ---- | -------- | ----- 
Points | Integer | true | none

When sending, it will spend the oldest transactions first. When returning it shows which payers it took points from, and how many points. 
Lets say we have these transactions:
* `{ payer: 'WALMART', points: 500, timestamp: '2021-02-02T11:00:00.000Z' }`
* `{ payer: 'HYVEE', points: 300, timestamp: '2021-01-03T11:00:00.000Z' }`
* `{ payer: 'WALMART', points: 1500, timestamp: '2021-03-04T15:00:00.000Z' }`

And you send `/transactions/spend?points=900`, it would return
```json
{
    "transactions": [
        {
            "payer": "HYVEE",
            "points": -300
        },
        {
            "payer": "WALMART",
            "points": -600
        }
    ]
}
```

## Getting Payers Balances
To get all the payers balances, send a `get` request to `/transactions`. It will return something like (based on previous data)

```json
{
    "transactions": [
        {
            "payer": "WALMART",
            "points": 1400
        },
        {
            "payer": "HYVEE",
            "points": 0
        }
    ]
}
```
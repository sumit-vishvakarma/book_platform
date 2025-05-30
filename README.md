# 🚀 Ruby on Rails 8.0.2 Setup Guide (with Ruby 3.2.2)

## 🧰 One-Block Setup for Ubuntu / macOS

```bash
# Install RVM
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

# Install Ruby 3.2.2
rvm install 3.2.2
rvm use 3.2.2 --default

# Install Rails
gem install rails -v 8.0.2

# Install Node.js and Yarn

## For Ubuntu
sudo apt update
sudo apt install -y nodejs npm
sudo npm install --global yarn

## For macOS (using Homebrew)
brew install node
brew install yarn

# Navigate to your project directory
cd your-project-name

# Install Ruby and JS dependencies
bundle install
yarn install

# Setup the database
rails db:create
rails db:migrate
rails db:seed

# Precompile assets
rails assets:clobber
rails assets:precompile

# Start the app
bin/dev

require "rubygems"
require "bundler/setup"
require "active_record"
require 'google/apis/calendar_v3'
require 'signet/oauth_2/client'

require 'slack-ruby-bot'
require_relative 'vacation-bot/commands/add'
require_relative 'vacation-bot/bot'

Dir[File.join(".", "models/*.rb")].each{|f| require f}
Dir[File.join(".", "models/**/*.rb")].each{|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

VacationBot::Bot.run

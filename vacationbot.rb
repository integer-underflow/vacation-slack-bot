require "rubygems"
require "bundler/setup"
require "active_record"
require 'google/apis/calendar_v3'
require 'signet/oauth_2/client'
require 'erb'

require 'slack-ruby-bot'
require_relative 'vacation-bot/commands/add'
require_relative 'vacation-bot/bot'

Dir[File.join(".", "models/*.rb")].each{|f| require f}
Dir[File.join(".", "models/**/*.rb")].each{|f| require f}

vacation_slack_bot_env = ENV['VACATION_SLACK_BOT_ENV'] || 'development'
connection_details = YAML.load(ERB.new(File.read("config/database.#{vacation_slack_bot_env}.yml")).result)
ActiveRecord::Base.establish_connection(connection_details)

VacationBot::Bot.run

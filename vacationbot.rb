require "rubygems"
require "bundler/setup"
require "active_record"

require 'slack-ruby-bot'
require_relative 'vacation-bot/commands/add'
require_relative 'vacation-bot/bot'

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/models/*.rb").each{|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

VacationBot::Bot.run

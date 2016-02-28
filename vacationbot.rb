require 'slack-ruby-bot'
require_relative 'vacation-bot/commands/absent'
require_relative 'vacation-bot/bot'

VacationBot::Bot.run

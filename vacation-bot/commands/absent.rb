module VacationBot
  module Commands
    class Absent < SlackRubyBot::Commands::Base
      date_regex = /(
      ((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|
      ((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|
      ((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|
      (29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))
      )/x

      match /^I will be absent on (?<date>#{date_regex})$/ do |client, data, match|
        user = client.users[data.user]
        client.say(channel: data.channel, text: "Ok, #{user.name} will be absent on #{match[:date]}.")
      end

      match /^I will be absent between (?<begin_date>#{date_regex}) and (?<end_date>#{date_regex})$/ do |client, data, match|
        user = client.users[data.user]
        client.say(channel: data.channel, text: "Ok, #{user.name} will be absent between #{match[:begin_date]} and  #{match[:end_date]}")
      end
    end
  end
end

module VacationBot
  module Commands
    class Add < SlackRubyBot::Commands::Base
      date_regex = /(
      ((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|
      ((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|
      ((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|
      (29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))
      )/x

      # leave today
      command 'I leave today' do |client, data, _match|
        user = client.users[data.user]
        leave = Leave.new(slack_user_id: user.id, leave_type: 1, date: Date.today)
        if (leave.save)
          client.say(channel: data.channel, text: "Ok, #{user.name} leave today")
        end
      end
    end
  end
end

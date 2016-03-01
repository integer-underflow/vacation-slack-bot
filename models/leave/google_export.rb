class Leave::GoogleCalendarExport
  def initialize(leave, client)
    @leave = leave
    @client = client
  end

  def export
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.authorization = @client
    event = Google::Apis::CalendarV3::Event.new({
      summary: "#{@leave.slack_user_id} leave",
      location: 'Thailand',
      start: {
        date: Date.today,
      },
      end: {
        date: Date.today,
      },
    })
    calendar.insert_event(ENV['GOOGLE_CALENDAR_ID'], event)
  end
end

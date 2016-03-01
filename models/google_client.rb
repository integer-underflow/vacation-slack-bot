class GoogleClient
  def self.client
    @client ||= Signet::OAuth2::Client.new(
      :authorization_uri => 'https://accounts.google.com/o/oauth2/auth',
      :token_credential_uri =>  'https://www.googleapis.com/oauth2/v3/token',
      :client_id => ENV['GOOGLE_CLIENT_ID'],
      :client_secret => ENV['GOOGLE_CLIENT_SECRET'],
      :scope => ['https://www.googleapis.com/auth/calendar','https://www.googleapis.com/auth/calendar.readonly'],
      :refresh_token => ENV["GOOGLE_REFRESH_TOKEN"],
    )
    fetch_access_token if expired?
    @client
  end

  private

  def self.expired?
    if @client.issued_at && @client.expires_in
      return Time.now >= @client.issued_at + @client.expires_in
    end
    true
  end

  def self.fetch_access_token
    @client.fetch_access_token
  end
end

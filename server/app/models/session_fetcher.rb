class SessionFetcher

  def self.find_or_fetch
    session = Session.last

    if session && session.created_at > 3.hours.ago
      session
    else
      sessions = V1::GoogleAnalyticsApi::Sessions.new
      sessions.fetch_sessions
    end
  end

end
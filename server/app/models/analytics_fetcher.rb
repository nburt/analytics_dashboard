class AnalyticsFetcher

  def self.page_view
    page_view = PageView.last

    if page_view && page_view.created_at > 3.hours.ago
      page_view
    else
      page_views = V1::GoogleAnalyticsApi::PageViews.new
      page_views.fetch_page_views
    end
  end

  def self.session
    session = Session.last

    if session && session.created_at > 3.hours.ago
      session
    else
      sessions = V1::GoogleAnalyticsApi::Sessions.new
      sessions.fetch_sessions
    end
  end

end
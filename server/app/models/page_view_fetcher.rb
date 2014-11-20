class PageViewFetcher

  def self.find_or_fetch
    page_view = PageView.last

    if page_view && page_view.created_at > 3.hours.ago
      page_view
    else
      google_analytics_api = V1::GoogleAnalyticsApi.new
      google_analytics_api.fetch_page_views
    end

  end

end
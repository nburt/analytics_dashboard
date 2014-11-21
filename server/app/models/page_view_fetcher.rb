class PageViewFetcher

  def self.find_or_fetch
    page_view = PageView.last

    if page_view && page_view.created_at > 3.hours.ago
      page_view
    else
      page_views = V1::GoogleAnalyticsApi::PageViews.new
      page_views.fetch_page_views
    end
  end

end
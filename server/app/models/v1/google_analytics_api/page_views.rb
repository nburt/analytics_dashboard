module V1
  class GoogleAnalyticsApi::PageViews < V1::GoogleAnalyticsApi

    def fetch_page_views
      analytics = @client.discovered_api('analytics', 'v3').data.ga.get
      parameters = {
        'ids' => ENV['PROFILE'],
        'start-date' => 30.days.ago.strftime("%Y-%m-%d"),
        'end-date' => Date.today.to_s,
        'dimensions' => 'ga:pagePath',
        'metrics' => 'ga:pageviews'
      }
      response = @client.execute(api_method: analytics, parameters: parameters)
      PageView.create!(response: response.body)
    end

  end
end
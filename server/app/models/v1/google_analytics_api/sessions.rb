module V1
  class GoogleAnalyticsApi::Sessions < V1::GoogleAnalyticsApi

    def fetch_sessions
      analytics = @client.discovered_api('analytics', 'v3').data.ga.get
      parameters = {
        'ids' => ENV['PROFILE'],
        'start-date' => 30.days.ago.strftime("%Y-%m-%d"),
        'end-date' => Date.today.to_s,
        'dimensions' => 'ga:pagePath',
        'metrics' => 'ga:sessions'
      }
      response = @client.execute(api_method: analytics, parameters: parameters)
      Session.create!(response: response.body)
    end

  end
end
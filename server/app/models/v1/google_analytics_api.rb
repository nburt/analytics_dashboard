require 'google/api_client'
module V1
  class GoogleAnalyticsApi

    def initialize
      @client = Google::APIClient.new(
        application_name: ENV['APPLICATION_NAME'],
        application_version: ENV['APPLICATION_VERSION']
      )
      authorize(@client)
    end

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

    private

    def authorize(client)
      client.authorization = Signet::OAuth2::Client.new(
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        audience: 'https://accounts.google.com/o/oauth2/token',
        scope: 'https://www.googleapis.com/auth/analytics.readonly',
        issuer: ENV['SERVICE_ACCOUNT_EMAIL_ADDRESS'],
        signing_key: Google::APIClient::KeyUtils.load_from_pkcs12(ENV['PATH_TO_KEY_FILE'], 'notasecret')
      ).tap { |auth| auth.fetch_access_token! }
    end

  end
end
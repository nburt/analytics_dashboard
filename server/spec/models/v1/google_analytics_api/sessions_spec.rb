require 'rails_helper'

describe V1::GoogleAnalyticsApi::Sessions do

  it 'fetches sessions data from google analytics' do
    VCR.use_cassette('/models/v1/google_analytics_api/sessions/fetch_sessions', match_requests_on: [:host, :path, :method]) do
      sessions = V1::GoogleAnalyticsApi::Sessions.new
      page_view = sessions.fetch_sessions

      expect(page_view.response['query']['metrics']).to eq(['ga:sessions'])
      expect(Session.count).to eq(1)
    end
  end

end
require 'rails_helper'

describe V1::GoogleAnalyticsApi::BounceRates do

  it 'fetches sessions data from google analytics' do
    VCR.use_cassette('/models/v1/google_analytics_api/bounce_rate/fetch_bounce_rate', match_requests_on: [:host, :path, :method]) do
      bounce_rate = V1::GoogleAnalyticsApi::BounceRates.new
      bounce_rate = bounce_rate.fetch_bounce_rates

      expect(bounce_rate.response['query']['metrics']).to eq(['ga:bounceRate'])
      expect(BounceRate.count).to eq(1)
    end
  end

end
require 'rails_helper'

describe V1::GoogleAnalyticsController, vcr: {match_requests_on: [:method,
  VCR.request_matchers.uri_without_params('end-date', 'start-date')]} do

  it 'can fetch page views' do
    VCR.use_cassette('/controllers/v1/page_views') do
      get :page_views

      parsed_body = Oj.load(response.body)

      page_view = PageView.last
      expect(page_view.response).to eq(parsed_body['response'])

      expect(response.status).to eq(200)
      expect(parsed_body['response']['query']['dimensions']).to eq('ga:pagePath')
      expect(parsed_body['response']['totalsForAllResults']['ga:pageviews']).to_not eq(nil)
    end
  end
end
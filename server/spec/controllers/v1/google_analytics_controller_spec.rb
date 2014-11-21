require 'rails_helper'

describe V1::GoogleAnalyticsController do

  it 'can fetch page views' do
    VCR.use_cassette('/controllers/v1/google_analaytics/page_views', match_requests_on: [:host, :path, :method]) do
      get :page_views

      parsed_body = Oj.load(response.body)

      page_view = PageView.last
      expect(page_view.response).to eq(parsed_body['response'])

      expect(response.status).to eq(200)
      expect(page_view.response['query']['metrics']).to eq(['ga:pageviews'])
      expect(parsed_body['response']['totalsForAllResults']['ga:pageviews']).to_not eq(nil)
    end
  end

  it 'can fetch sessions information' do
    VCR.use_cassette('/controllers/v1/google_analytics/sessions', match_requests_on: [:host, :path, :method]) do
      get :sessions

      parsed_body = Oj.load(response.body)

      sessions = Session.last
      expect(sessions.response).to eq(parsed_body['response'])

      expect(response.status).to eq(200)
      expect(sessions.response['query']['metrics']).to eq(['ga:sessions'])
      expect(parsed_body['response']['totalsForAllResults']['ga:sessions']).to_not eq(nil)
    end
  end

end
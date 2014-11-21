require 'rails_helper'

describe V1::GoogleAnalyticsApi::PageViews do

  it 'fetches page views data from google analytics' do
    VCR.use_cassette('/models/v1/google_analytics_api/page_views/fetch_page_views', match_requests_on: [:host, :path, :method]) do
      page_views = V1::GoogleAnalyticsApi::PageViews.new
      page_view = page_views.fetch_page_views

      expect(page_view.response['query']['metrics']).to eq(['ga:pageviews'])
      expect(PageView.count).to eq(1)
    end
  end

end
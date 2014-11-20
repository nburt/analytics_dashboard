require 'rails_helper'

describe PageViewFetcher, vcr: {
  match_requests_on: [:method, VCR.request_matchers.uri_without_params('end-date', 'start-date')]} do

  it 'will call to the Google Analytics API if there are no page views' do
    VCR.use_cassette('/models/page_view_fetcher/no_page_views') do
      page_view = PageViewFetcher.find_or_fetch

      expect(page_view.response['query']['dimensions']).to eq('ga:pagePath')
    end
  end

  it 'will call to the Google Analytics API if there are no page views within the last 3 hours' do
    VCR.use_cassette('/models/page_view_fetcher/outdated_page_views') do
      PageView.create!(response: File.read(Rails.root.join("spec/support/page_view.json")), created_at: 4.hours.ago)
      expect(PageView.count).to eq(1)

      page_view = PageViewFetcher.find_or_fetch

      expect(page_view.response['query']['dimensions']).to eq('ga:pagePath')
      expect(PageView.count).to eq(2)
    end
  end

  it 'will retrieve a page view if one has been created within the past 3 hours' do
    PageView.create!(response: File.read(Rails.root.join("spec/support/page_view.json")), created_at: 2.hours.ago)
    expect(PageView.count).to eq(1)

    page_view = PageViewFetcher.find_or_fetch

    expect(page_view.response['query']['dimensions']).to eq('ga:pagePath')
    expect(PageView.count).to eq(1)
  end

end
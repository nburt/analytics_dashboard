require 'rails_helper'

describe AnalyticsFetcher do

  describe 'page views' do

    it 'will call to the Google Analytics API if there are no page views' do
      VCR.use_cassette('/models/analytics_fetcher/no_page_views', match_requests_on: [:host, :path, :method]) do
        page_view = AnalyticsFetcher.page_view

        expect(page_view.response['query']['metrics']).to eq(['ga:pageviews'])
        expect(PageView.count).to eq(1)
      end
    end

    it 'will call to the Google Analytics API if there are no page views within the last 3 hours' do
      VCR.use_cassette('/models/analytics_fetcher/outdated_page_views', match_requests_on: [:host, :path, :method]) do
        PageView.create!(response: File.read(Rails.root.join('spec/support/page_view.json')), created_at: 4.hours.ago)
        expect(PageView.count).to eq(1)

        page_view = AnalyticsFetcher.page_view

        expect(page_view.response['query']['metrics']).to eq(['ga:pageviews'])
        expect(PageView.count).to eq(2)
      end
    end

    it 'will retrieve a page view if one has been created within the past 3 hours' do
      PageView.create!(response: File.read(Rails.root.join('spec/support/page_view.json')), created_at: 2.hours.ago)
      expect(PageView.count).to eq(1)

      page_view = AnalyticsFetcher.page_view

      expect(page_view.response['query']['metrics']).to eq(['ga:pageviews'])
      expect(PageView.count).to eq(1)
    end

  end

  describe 'sessions' do

    let(:response) { {'query' => {'metrics' => ['ga:sessions']}} }

    it 'will call to the Google Analytics API if there are no sessions' do
      VCR.use_cassette('/models/analytics_fetcher/no_sessions', match_requests_on: [:host, :path, :method]) do
        session = AnalyticsFetcher.session

        expect(session.response['query']['metrics']).to eq(['ga:sessions'])
        expect(Session.count).to eq(1)
      end
    end

    it 'will call to the Google Analytics API if there are no sessions within the last 3 hours' do
      VCR.use_cassette('/models/analytics_fetcher/outdated_sessions', match_requests_on: [:host, :path, :method]) do
        Session.create!(response: response, created_at: 4.hours.ago)
        expect(Session.count).to eq(1)

        session = AnalyticsFetcher.session

        expect(session.response['query']['metrics']).to eq(['ga:sessions'])
        expect(Session.count).to eq(2)
      end
    end

    it 'will retrieve a session if one has been created within the past 3 hours' do
      Session.create!(response: response, created_at: 2.hours.ago)
      expect(Session.count).to eq(1)

      session = AnalyticsFetcher.session

      expect(session.response['query']['metrics']).to eq(['ga:sessions'])
      expect(Session.count).to eq(1)
    end

  end

  describe 'bounce_rate' do

    let(:response) { {'query' => {'metrics' => ['ga:bounceRate']}} }

    it 'will call to the Google Analytics API if there are no bounce rates' do
      VCR.use_cassette('/models/analytics_fetcher/no_bounce_rate', match_requests_on: [:host, :path, :method]) do
        bounce = AnalyticsFetcher.bounce_rate

        expect(bounce.response['query']['metrics']).to eq(['ga:bounceRate'])
        expect(BounceRate.count).to eq(1)
      end
    end

    it 'will call to the Google Analytics API if there are no bounce rates within the last 3 hours' do
      VCR.use_cassette('/models/analytics_fetcher/outdated_bounce_rate', match_requests_on: [:host, :path, :method]) do
        BounceRate.create!(response: response, created_at: 4.hours.ago)
        expect(BounceRate.count).to eq(1)

        bounce_rate = AnalyticsFetcher.bounce_rate

        expect(bounce_rate.response['query']['metrics']).to eq(['ga:bounceRate'])
        expect(BounceRate.count).to eq(2)
      end
    end

    it 'will retrieve a bounce rate if one has been created within the past 3 hours' do
      BounceRate.create!(response: response, created_at: 2.hours.ago)
      expect(BounceRate.count).to eq(1)

      bounce_rate = AnalyticsFetcher.bounce_rate

      expect(bounce_rate.response['query']['metrics']).to eq(['ga:bounceRate'])
      expect(BounceRate.count).to eq(1)
    end

  end

end
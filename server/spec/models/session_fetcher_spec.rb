require 'rails_helper'

describe SessionFetcher do

  let(:response) { {'query' => {'metrics' => ['ga:sessions']}} }

  it 'will call to the Google Analytics API if there are no sessions' do
    VCR.use_cassette('/models/session_fetcher/no_sessions', match_requests_on: [:host, :path, :method]) do
      session = SessionFetcher.find_or_fetch

      expect(session.response['query']['metrics']).to eq(['ga:sessions'])
      expect(Session.count).to eq(1)
    end
  end

  it 'will call to the Google Analytics API if there are no sessions within the last 3 hours' do
    VCR.use_cassette('/models/session_fetcher/outdated_sessions', match_requests_on: [:host, :path, :method]) do
      Session.create!(response: response, created_at: 4.hours.ago)
      expect(Session.count).to eq(1)

      session = SessionFetcher.find_or_fetch

      expect(session.response['query']['metrics']).to eq(['ga:sessions'])
      expect(Session.count).to eq(2)
    end
  end

  it 'will retrieve a session if one has been created within the past 3 hours' do
    Session.create!(response: response, created_at: 2.hours.ago)
    expect(Session.count).to eq(1)

    session = SessionFetcher.find_or_fetch

    expect(session.response['query']['metrics']).to eq(['ga:sessions'])
    expect(Session.count).to eq(1)
  end

end
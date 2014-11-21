module V1
  class GoogleAnalyticsController < ApplicationController

    def page_views
      page_view = PageViewFetcher.find_or_fetch
      render json: page_view, status: 200
    end

    def sessions
      session = SessionFetcher.find_or_fetch
      render json: session, status: 200
    end

  end
end
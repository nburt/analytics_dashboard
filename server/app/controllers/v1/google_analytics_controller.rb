module V1
  class GoogleAnalyticsController < ApplicationController

    def page_views
      page_view = AnalyticsFetcher.page_view
      render json: page_view, status: 200
    end

    def sessions
      session = AnalyticsFetcher.session
      render json: session, status: 200
    end

  end
end
module V1
  class GoogleAnalyticsController < ApplicationController

    def page_views
      google_analytics_api = GoogleAnalyticsApi.new
      page_views = google_analytics_api.fetch_page_views
      render json: page_views, status: 200
    end

    def page_view

    end

  end
end
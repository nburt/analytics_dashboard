Rails.application.routes.draw do
  namespace :v1 do
    get '/google_analytics/page_views', to: 'google_analytics#page_views'
    get '/google_analytics/sessions', to: 'google_analytics#sessions'
    get '/google_analytics/bounce_rates', to: 'google_analytics#bounce_rates'
  end
end

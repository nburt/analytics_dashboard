Rails.application.routes.draw do
  namespace :v1 do
    get '/google_analytics/page_views', to: 'google_analytics#page_views'
    get '/google_analytics/sessions', to: 'google_analytics#sessions'
  end
end

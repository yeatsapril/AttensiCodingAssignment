Rails.application.routes.draw do
  namespace :v1 do
    resources :players, :playthroughs
    resources :weekly_summaries, only: [:index]
    resources :impact_reports, only: [:index]
  end
end

Rails.application.routes.draw do
  resources :players, :playthroughs
  resources :weekly_summaries, only: [:index]
  resources :impact_reports, only: [:index]
end

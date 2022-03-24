Rails.application.routes.draw do
  namespace :v1 do
    resources :players, :playthroughs
    resources :impact_reports, only: [:index]
    get "weekly_summaries/score" => "weekly_summaries#score", as: :score
    get "weekly_summaries/time_played" => "weekly_summaries#time_played", as: :time_played
  end
end

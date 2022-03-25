module V1
  class PlaythroughsController < ApplicationController
  before_action :set_playthrough, only: [:show, :destroy]

    def index
      @playthroughs = Playthrough.all
      render json: @playthroughs
    end

    def show
      render json: @playthrough
    end

    def create
      @playthrough = Playthrough.new(playthrough_params)
      @playthrough.time_spent = set_time_played

      if @playthrough.save
        render json: @playthrough
      else
        render json: { error: 'playthrough creation failed' }, status: 400
      end
    end

    def destroy
      if @playthrough
        @playthrough.destroy
        render json: @playthrough, status: 200
      else
        render json: { error: 'playthrough deletion failed' }, status: 400
      end
    end

    private

    def playthrough_params
      params.permit(:started_playing, :finished_playing, :score, :player_id)
    end

    def set_playthrough
      @playthrough = Playthrough.find(params[:id])
    end

    def set_time_played
      TimeSpentService.calculate_time_spent!(@playthrough.finished_playing, @playthrough.started_playing)
    end
  end
end

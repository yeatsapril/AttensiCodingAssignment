module V1
  class PlaythroughsController < ApplicationController
  before_action :set_playthrough, only: [:show, :update, :destroy]

    def index
      @playthroughs = Playthrough.all
      render json: @playthroughs
    end

    def show
      render json: @playthrough
    end


    def create
      if @playthrough.save
        render json: @playthrough
      else
        render json: { error: 'playthrough creation failed' }, status: 400
      end
    end

    def update
      if @playthrough
        @playthrough.update(playthrough_params)
        render json: @playthrough, status: 200
      else
        render json: { error: 'playthrough update failed' }, status: 400
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
      params.permit(:started_playing, :time_spent, :score, :player)
    end

    def set_playthrough
      @playthrough = Playthrough.find(params[:id])
    end
  end
end

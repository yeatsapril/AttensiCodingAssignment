module V1
  class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :update, :destroy]

    def index
      @players = Player.all
      render json: @players
    end

    def show
      render json: @player
    end

    def create
      @player = Player.new(player_params)

      if @player.save
        render json: @player
      else
        render json: { error: 'player creation failed' }, status: 400
      end
    end

    def update
      if @player
        @player.update(player_params)
        render json: @player, status: 200
      else
        render json: { error: 'player update failed' }, status: 400
      end
    end

    def destroy
      if @player
        @player.destroy
        render json: @player, status: 200
      else
        render json: { error: 'player deletion failed' }, status: 400
      end
    end

    private

    def player_params
      params.permit(:name)
    end

    def set_player
      @player = Player.find(params[:id])
    end
  end
end

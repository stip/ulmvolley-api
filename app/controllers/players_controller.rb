class PlayersController < ApplicationController

  before_action :set_player, only: [:show]

  def index
    @players = Player.reduce(params)
    json_response(@players)
  end


  def create
    @player = Player.create!(player_params)
    json_response(@player, :created)
  end


  def show
    json_response(@player)
  end

private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.permit(:name, :nick, :birthday)
  end

end

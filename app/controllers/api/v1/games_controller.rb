# frozen_string_literal: true

class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  def index
    if params[:developer_id]
      @developer = Developer.find(params[:developer_id])
      @games = Game.where(developer: @developer)
    elsif params[:platform_id]
      @platform = Platform.find(params[:platform_id])
      @games = Game.joins(:game_platforms).where(game_platforms: { platform: @platform })
    else
      @games = Game.all
    end
  end

  def show; end

  def create
    @game = Game.new(game_params)
    @game.developer = Developer.find(params[:developer_id])
    if @game.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @game.update(game_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @game.destroy
    head :no_content
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :photo, :release_date, :rating)
  end

  def render_error
    render json: { errors: @game.errors.full_messages },
           status: :unprocessable_entity
  end
end

# frozen_string_literal: true

class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  def index
    if params[:developer_id]
      @developer = Developer.find(params[:developer_id])
      @games = Game.where(developer: @developer)
    else
      @games = Game.all
    end
  end

  def show; end

  def create
    @game = Game.new(game_params)
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
    params.require(:game).permit(:name, :image)
  end

  def render_error
    render json: { errors: @game.errors.full_messages },
           status: :unprocessable_entity
  end
end

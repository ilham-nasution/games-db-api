# frozen_string_literal: true

class Api::V1::GamePlatformsController < ApplicationController
  def create
    @gameplatform = GamePlatform.new
    @gameplatform.game = Game.find(params[:game_id])
    @gameplatform.platform = Game.find(params[:platform_id])
    if @gameplatform.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def render_error
    render json: { errors: @game.errors.full_messages },
           status: :unprocessable_entity
  end
end

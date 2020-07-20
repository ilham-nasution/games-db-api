# frozen_string_literal: true

class Api::V1::PlatformsController < ApplicationController
  before_action :set_platform, only: %i[show update destroy]

  def index
    @platforms = Platform.all
  end

  def show; end

  def create
    @platform = Platform.new(platform_params)
    if @platform.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @platform.update(platform_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @platform.destroy
    head :no_content
  end

  private

  def set_platform
    @platform = Platform.find(params[:id])
  end

  def platform_params
    params.permit(:name, :image)
  end

  def render_error
    render json: { errors: @platform.errors.full_messages },
           status: :unprocessable_entity
  end
end

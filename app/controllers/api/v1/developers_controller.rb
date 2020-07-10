# frozen_string_literal: true

class Api::V1::DevelopersController < ApplicationController
  before_action :set_developer, only: %i[show update destroy]

  def index
    @developers = Developer.all
  end

  def show; end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @developer.update(developer_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @developer.destroy
    head :no_content
  end

  private

  def set_developer
    @developer = Developer.find(params[:id])
  end

  def developer_params
    params.require(:developer).permit(:name, :image, :photo)
  end

  def render_error
    render json: { errors: @developer.errors.full_messages },
           status: :unprocessable_entity
  end
end

# frozen_string_literal: true

class Api::V1::DevelopersController < ApplicationController
  before_action :set_developer, only: %i[show update destroy]

  def index
    @developers = Developer.all
  end

  def show; end

  def create
    @developer = Developer.new(developer_params)
  end

  def update
    @developer.update(developer_params)
  end

  def destroy
    @developer.destroy
  end

  private

  def set_developer
    @developer = Developer.find(params[:id])
  end

  def developer_params
    params.require(:developer).permit(:name, :image)
  end
end

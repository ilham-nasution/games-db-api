# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :developer
  has_many :game_platforms, dependent: :destroy
  has_many :platforms, through: :game_platforms
  has_one_attached :photo

  validates_presence_of :title, on: :create, message: "can't be blank"
end

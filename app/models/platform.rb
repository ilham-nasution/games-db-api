# frozen_string_literal: true

class Platform < ApplicationRecord
  has_many :game_platforms
  has_many :games, through: :game_platforms
  has_one_attached :photo

  validates_presence_of :name, on: :create, message: "can't be blank"
end

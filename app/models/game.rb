# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :developer
  has_many :game_platforms
  has_many :platforms, through: :game_platforms

  validates_presence_of :title, on: :create, message: "can't be blank"
end

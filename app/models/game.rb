# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :developer

  validates_presence_of :title, on: :create, message: "can't be blank"
end

# frozen_string_literal: true

class Developer < ApplicationRecord
  has_many :games, dependent: :destroy

  validates_presence_of :name, on: :create, message: "can't be blank"
  validates_uniqueness_of :name, on: :create, message: 'must be unique'
end

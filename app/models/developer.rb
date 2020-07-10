# frozen_string_literal: true

class Developer < ApplicationRecord
  has_many :games, dependent: :destroy
  has_one_attached :photo

  validates_presence_of :name, on: :create, message: "can't be blank"
  validates_uniqueness_of :name, on: :create, message: 'must be unique'
end

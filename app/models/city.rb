class City < ApplicationRecord
  has_many :customers, dependent: :destroy
  has_and_belongs_to_many :zipcodes
  belongs_to :state
end

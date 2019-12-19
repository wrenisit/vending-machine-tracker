class Machine < ApplicationRecord
  include ActionView::Helpers
  validates_presence_of :location
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_price
    cost = snacks.average(:price).to_f
    number_to_currency(cost)
  end
end

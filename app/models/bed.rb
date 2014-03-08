class Bed < ActiveRecord::Base
  belongs_to :user
  has_many :reservations

  def price
    "$%.2f" % self[:price]
  end

end

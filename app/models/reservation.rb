class Reservation < ActiveRecord::Base
  belongs_to :bed
  
  validates :quantity, :presence => true



  # def self.reservations_by_date(id)
  #   a = {}
  #   d = where('bed_id = ?', id)
  #   d.each do |b|
  #     # c = Hash[(b.arrival..b.departure).collect {|date| [date, b.quantity]}]
  #     c = {}.tap{|h| (b.arrival..b.departure - 1).each{|m| h[m] = b.quantity}}
  #     a.merge!(c) {|k,o,n| o + n}
  #   end
  #   return a
  # end


  # validate :not_overlap, :if => :not_full?
 
  # scope :overlaps, ->(arrival, departure) do
  #   where "((arrival <= ?) and (departure >= ?))", departure, arrival
  # end

  # def overlaps?
  #   overlaps.exists?
  # end

  # def overlaps
  #   siblings.overlaps arrival, departure
  # end

  # def not_overlap
  #   errors.add(:arrival, 'date is full, please select another date') if overlaps?
  # end

  # def siblings
  #   Reservation.where('bed_id = ?', bed_id).where('arrival <= ? and departure >= ?', departure, arrival)
  # end

  # def siblings_total
  #   siblings.sum('quantity') + quantity
  # end

  # def parent
  #   Bed.find(bed_id)
  # end

  # def not_full?
  #   siblings_total < parent.quantity
  # end

end

# Game plan for 11/13/13

# Install date_validator
# Install validator_overlaps
# Create conditional validator for validator_overlaps :if => :quantity_exceeds_maximum?

# def :quantity_exceeds_maximum?
#   for self.reservation.quantit
#     check receipt algorith
# end

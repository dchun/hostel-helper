class Availability
  def initialize(bed)
    @bed = bed
  end

  def reservation
    Reservation.where('bed_id = ?', @bed)
  end

  def bed
    Bed.find(@bed)
  end

  def reserved
    a = {}
    reservation.each do |b|
      # c = Hash[(b.arrival..b.departure).collect {|date| [date, b.quantity]}]
      c = {}.tap{|h| (b.arrival..b.departure - 1).each{|m| h[m] = b.quantity}}
      a.merge!(c) {|k,o,n| o + n}
    end
    return a
  end

  def availability
    reserved.inject({}) { |h, (k, v)| h[k] = bed.quantity - v; h }
  end
end

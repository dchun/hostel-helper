json.array!(@reservations) do |reservation|
  json.extract! reservation, :arrival, :departure, :name, :email, :phone, :message, :quantity, :beds_id
  json.url reservation_url(reservation, format: :json)
end

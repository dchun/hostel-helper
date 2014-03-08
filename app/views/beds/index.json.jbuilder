json.array!(@beds) do |bed|
  json.extract! bed, :start_date, :end_date, :price, :quantity, :name, :description, :image, :max_bookable, :max_days_before, :payment_method, :user_id
  json.url bed_url(bed, format: :json)
end

json.array!(@orders) do |order|
  json.extract! order, :id, :date, :bill_to_name, :bill_to_org, :bill_to_address, :bill_to_email, :extra_notes, :extra_others
  json.url order_url(order, format: :json)
end

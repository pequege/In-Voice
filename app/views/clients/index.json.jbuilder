json.array!(@clients) do |client|
  json.extract! client, :id, :name, :order_id
  json.url client_url(client, format: :json)
end

json.array!(@details) do |detail|
  json.extract! detail, :id, :project, :order_id
  json.url detail_url(detail, format: :json)
end

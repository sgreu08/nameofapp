json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :image_url, :string
  json.url product_url(product, format: :json)
end

json.array!(@thems) do |them|
  json.extract! them, :id, :name, :content
  json.url them_url(them, format: :json)
end

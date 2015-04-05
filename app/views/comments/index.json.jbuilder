json.array!(@comments) do |comment|
  json.extract! comment, :id, :name, :article_id
  json.url comment_url(comment, format: :json)
end

json.array!(@book_repositories) do |book_repository|
  json.extract! book_repository, :id, :name
  json.url book_repository_url(book_repository, format: :json)
end

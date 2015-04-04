json.array!(@books) do |book|
  json.extract! book, :id, :name, :isbn_no, :quantity
  json.url book_url(book, format: :json)
end

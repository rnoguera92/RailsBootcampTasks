json.extract! book, :id, :name, :price, :author, :editor, :description, :category_id, :created_at, :updated_at
json.url book_url(book, format: :json)

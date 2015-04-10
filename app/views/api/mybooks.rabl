object false
child @mybooks, object_root: false do
	attributes :id, :name, :isbn_no
	node(:date){ |u| u.user_books.first.date.strftime("%b %d, %Y")}
	node(:author){ |u| u.authors.first.name}
	node(:category) {|u| u.categories.first.category_name}
end

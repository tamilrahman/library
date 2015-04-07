object false
child @mybooks, object_root: false do
	attributes :name, :isbn_no
	node(:date){ |u| u.created_at.strftime("%b %d, %Y")}
	node(:author){ |u| u.authors.name}
	node(:category) {"Engineering books"}
end

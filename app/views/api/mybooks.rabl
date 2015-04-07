object false
child @mybooks, object_root: false do
	attributes :name
	node(:author){ |u| u.authors.name}
end

class LibrarianController < ApplicationController
	before_action :authenticate_librarian!
  def index
  end
end

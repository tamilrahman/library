class BookRepositoriesController < ApplicationController
  before_action :set_book_repository, only: [:show, :edit, :update, :destroy]

  # GET /book_repositories
  # GET /book_repositories.json
  def index
    @book_repositories = BookRepository.all
  end

  # GET /book_repositories/1
  # GET /book_repositories/1.json
  def show
  end

  # GET /book_repositories/new
  def new
    @book_repository = BookRepository.new
  end

  # GET /book_repositories/1/edit
  def edit
  end

  # POST /book_repositories
  # POST /book_repositories.json
  def create
    @book_repository = BookRepository.new(book_repository_params)

    respond_to do |format|
      if @book_repository.save
        format.html { redirect_to @book_repository, notice: 'Book repository was successfully created.' }
        format.json { render :show, status: :created, location: @book_repository }
      else
        format.html { render :new }
        format.json { render json: @book_repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_repositories/1
  # PATCH/PUT /book_repositories/1.json
  def update
    respond_to do |format|
      if @book_repository.update(book_repository_params)
        format.html { redirect_to @book_repository, notice: 'Book repository was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_repository }
      else
        format.html { render :edit }
        format.json { render json: @book_repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_repositories/1
  # DELETE /book_repositories/1.json
  def destroy
    @book_repository.destroy
    respond_to do |format|
      format.html { redirect_to book_repositories_url, notice: 'Book repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_repository
      @book_repository = BookRepository.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_repository_params
      params.require(:book_repository).permit(:name)
    end
end

require 'test_helper'

class BookRepositoriesControllerTest < ActionController::TestCase
  setup do
    @book_repository = book_repositories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_repositories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_repository" do
    assert_difference('BookRepository.count') do
      post :create, book_repository: { name: @book_repository.name }
    end

    assert_redirected_to book_repository_path(assigns(:book_repository))
  end

  test "should show book_repository" do
    get :show, id: @book_repository
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_repository
    assert_response :success
  end

  test "should update book_repository" do
    patch :update, id: @book_repository, book_repository: { name: @book_repository.name }
    assert_redirected_to book_repository_path(assigns(:book_repository))
  end

  test "should destroy book_repository" do
    assert_difference('BookRepository.count', -1) do
      delete :destroy, id: @book_repository
    end

    assert_redirected_to book_repositories_path
  end
end

class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  protect_from_forgery

  def index
    @books = policy_scope(Book)
  end

  def show
    # @book = Book.find(params[:id])
    @book = Book.new(book_params)
    @bookmark = Bookmark.new
    @log = Log.new
    @not_duplicated_bookmark = not_duplicated_bookmark?
    @not_duplicated_log = not_duplicated_log?
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    authorize @book
    @book.save
  end

  def not_duplicated_bookmark?
    @user = current_user
    @bookmarks = policy_scope(Bookmark).where(user: @user)
    duplicated_checker = @bookmarks.map do |bookmark|
      bookmark.book == @book
    end
    return duplicated_checker.none?(true)
  end

  def not_duplicated_log?
    @user = current_user
    @logs = policy_scope(Log).where(user: @user)
    duplicated_checker = @logs.map do |log|
      log.book == @book
    end
    return duplicated_checker.none?(true)
  end

  private

  def book_params
    params.permit(:title, :author, :publisher, :price, :image_url)
  end
end

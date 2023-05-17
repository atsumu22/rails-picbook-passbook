class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  # skip_before_action :verify_authenticity_token
  protect_from_forgery
  after_action :set_csrf_token_header

  def index
    @books = policy_scope(Book)
  end

  def show
    @book = Book.last
    @book = Book.new(book_params)
    @bookmark = Bookmark.new
    @log = Log.new
    @not_duplicated_bookmark = not_duplicated_bookmark?
    @not_duplicated_log = not_duplicated_log?
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    # @book.user_id = 2
    authorize @book
    # respond_to do |format|
    @book.save
    # raise
      # format.html
      # format.json { render json: @book }
    # end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publisher, :price, :image_url, :status)
  end
end

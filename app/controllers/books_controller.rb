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
    # respond_to do |format|
      @book.save
    #  format.html
    #   format.json { render json: @book }
    # end
  end

  private

  def book_params
    params.permit(:title, :author, :publisher, :price, :image_url)
  end
end

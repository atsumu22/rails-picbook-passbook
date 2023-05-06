class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @books = policy_scope(Book)
  end

  def show
    @book = Book.find(params[:id])
    authorize @book
  end
end

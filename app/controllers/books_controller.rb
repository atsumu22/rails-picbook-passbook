class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @books = policy_scope(Book)
  end
end

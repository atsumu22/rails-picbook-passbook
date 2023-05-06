class BookmarksController < ApplicationController
  before_action :set_book, only: %i[new create]

  def index
    @user = current_user
    @bookmarks = policy_scope(Bookmark).where(user: @user)
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.book = @book
    @bookmark.user = current_user
    @user = current_user
    @bookmarks = policy_scope(Bookmark).where(user: @user)
    @duplicated_checker = @bookmarks.map do |bookmark|
      bookmark.book == @book
    end
    authorize @bookmark
    if @duplicated_checker.none?(true)
      @bookmark.save
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end

class BookmarksController < ApplicationController
  before_action :set_book, only: %i[new create]
  protect_from_forgery :except => [:destroy]

  def index
    @user = current_user
    @bookmarks = policy_scope(Bookmark).where(user: @user)
    @logs = policy_scope(Log).where(user: @user)
    @books_as_logs = @logs.map do |log|
      log.book
    end
    @bookmarks.each do |bookmark|
      if @books_as_logs.include?(bookmark.book)
        bookmark.destroy
      end
    end
    @log = Log.new
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.book = @book
    @bookmark.user = current_user
    authorize @bookmark
    if not_duplicated_bookmark?
      @bookmark.save
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
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

  def set_book
    @book = Book.find(params[:book_id])
  end
end

class BookmarksController < ApplicationController
  # before_action :set_lesson, only: %i[new create edit update]

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
  end

  private

  def set
end

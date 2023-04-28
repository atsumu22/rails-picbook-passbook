class BookmarksController < ApplicationController
  # before_action :set_lesson, only: %i[new create edit update]

  def index
    @user = current_user
    @bookmarks = policy_scope(Bookmark).where(user: @user)
  end
end

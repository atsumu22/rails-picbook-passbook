class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def search
  end

  def query
    @books = Book.all
  end

  def barcode
  end

  def statistics
  end

  def logsedit
    @user = current_user
    @logs = policy_scope(Log).where(user: @user)
  end
end

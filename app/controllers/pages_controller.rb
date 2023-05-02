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
end

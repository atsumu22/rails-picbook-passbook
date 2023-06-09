class LogsController < ApplicationController
  before_action :set_book, only: %i[new create]
  protect_from_forgery

  def index
    @user = current_user
    @logs = policy_scope(Log).where(user: @user)
    @prices = @logs.map {|log| log.book.original_price }
    @total_sum = @prices.sum
  end

  def new
    @log = Log.new
    authorize @log
  end

  def create
    @log = Log.new
    @log.book = @book
    @log.user = current_user
    authorize @log
    @log.save
    redirect_to logs_path
  end

  def destroy
    @log = Log.find(params[:id])
    authorize @log
    @log.destroy
    redirect_to logsedit_path, status: :see_other
  end

  private

  def set_book
    # finding_book = Book.last
    @book = Book.last
  end

  def book_params
    params.permit(:title, :author, :publisher, :price, :image_url, :status)
  end
end

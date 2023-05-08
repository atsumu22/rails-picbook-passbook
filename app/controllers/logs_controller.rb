class LogsController < ApplicationController
  before_action :set_book, only: %i[new create]

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
    if not_duplicated_log?
      @log.save
      redirect_to logs_path
    end
  end

  def destroy
    @log = Log.find(params[:id])
    authorize @log
    @log.destroy
    redirect_to logsedit_path, status: :see_other
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

class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  # skip_before_action :verify_authenticity_token
  protect_from_forgery
  after_action :set_csrf_token_header

  def index
    @books = policy_scope(Book)
  end

  def show
    @book = Book.last
    @book = Book.new(book_params)
    @bookmark = Bookmark.new
    @log = Log.new
    @not_duplicated_bookmark = not_duplicated_bookmark?
    @not_duplicated_log = not_duplicated_log?
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @duplicate_book = Book.where(title: @book.title, author: @book.author, user: current_user).first
    # nilのパターン
    authorize @book
    if @duplicate_book.nil?
      @book.save
      flash.now[:notice] = "『#{@book.title}』を記録しました！"
      render :index
      # redirect_to barcode_path
      # POSTリクエストからのリダイレクトはGETリクエストになってしまうのでだめ。
    elsif @duplicate_book && @duplicate_book.status == @book.status
    # 既に要素は存在するかつstatusも一緒のパターン -> インスタンスは生成しない
      flash.now[:notice] = "『#{@book.title}』はすでに通帳に記録されています。"
      render :index
    elsif @duplicate_book && @duplicate_book.status != @book.status
    # 既に要素は存在するが、statusがことなるパターン-> インスタンスは生成せず、statusを切り替える。
      # if @duplicate_book.bookmark?
        # @duplicate_book.log!
        # flash[:notice] = "ブックマークされていた本を通帳に記録しました。"
      # else
        # @duplicate_book.log!
        # flash[:notice] = "通帳に記録されていた本をブックマークへと移動しました。"
      # end
      @duplicate_book.bookmark? ?  @duplicate_book.log! : @duplicate_book.bookmark!
    end



    # @book.user_id = 2
    # respond_to do |format|
    # raise
      # format.html
      # format.json { render json: @book }
    # end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publisher, :price, :image_url, :status)
  end
end

class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  impressionist :actions => [:show]

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @nbook = Book.new
    @book_comment = BookComment.new
    @book_comments = BookComment.all
    impressionist(@book, nil, unique: [:session_hash.to_s])
  end

  def index
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    @books = Book.includes(:favorited_users).
      sort_by {|x|
        x.favorited_users.includes(:favorites).where(created_at: from..to).size}.reverse
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    user_id = @book.user_id
    unless user_id == current_user.id
      redirect_to books_path
    end
  end
end

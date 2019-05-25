class BooksController < ApplicationController

before_action :authenticate_user!, only: [:create, :index, :show, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
    #@books = Book.all
    #@book = Book.new

  end

  def create
  	 @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
      redirect_to book_path(@book), notice:"posted successfully!"
     else redirect_to books_path, notice:"error!"
     end
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book), notice:"edited successfully!"
    else redirect_to book_path(book), notice:"error!"
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
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

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end

end

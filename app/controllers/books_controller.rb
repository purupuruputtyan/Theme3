class BooksController < ApplicationController
  def create#10章
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = 'You have created book succesfully.'
    redirect_to book_path(@book.id)
    else
    render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = User.find(@book.user[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = 'Book was successfully updated.'
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private

  def book_params#10章
    params.require(:book).permit(:title, :body)
  end
end
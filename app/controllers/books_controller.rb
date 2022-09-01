class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@books = Book.all
  	if @book.save
  	 redirect_to book_path(@book.id)
  	else
  	 render :index
  	end
  	flash[:notice] = "successfully"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.update(book_params)
  	if @book.save
  	 redirect_to book_path(@book.id)
  	else
  	 render :edit
  	end
  	flash[:notice] = "successfully"
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
   flash[:notice] = "successfully"
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
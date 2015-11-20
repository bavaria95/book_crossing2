class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  def index
    @book = Book.all.order("created_at DESC")
    
  end

  def show

    
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Created"
    else
      render 'new'
      
    end
  end

  def edit

    
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
      
    end
    
  end

  def destroy
    @book.destroy
    redirect_to root_path, notice: "Deleted"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :image )
  end

  def find_book
    @book = Book.find(params[:id])
  end
end

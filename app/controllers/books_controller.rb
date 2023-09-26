class BooksController < ApplicationController
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
      @user = current_user
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
    @user = User.find(params[:id])
    @book_new = Book.new
    
  end

  def edit
    @book = Book.find(params[:id])
    
  end
  
  def update
    @book = Book.find(params[:id])
    @user = current_user
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render :edit
    end 
  end
  
  def destroy
    book = Book.find(params[:id])  
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'  
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end

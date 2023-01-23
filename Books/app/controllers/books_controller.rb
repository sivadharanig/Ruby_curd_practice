class BooksController < ApplicationController
    def index
        @books=Book.all
    end
    def new
        @book = Book.new
    end
    def create
        @book = Book.new(room_params)
    
        if @book.save
          redirect_to @book
          redirect_to @book
        else
          render :new, status: :unprocessable_entity
        end
      end
    
    def show
        @book=Book.find(params[:id])
    end
    def destroy
        @book =Book.find(params[:id])
        @book.destroy
        redirect_to  root_path
    end
    def edit
        @book= Book.find(params[:id])
    end
    def update
        @book= Book.find(params[:id])
        if @book.update(room_params)
           redirect_to @book
        else
        end
    end
    def room_params
        params.require(:book).permit(:name, :price)
    end
end

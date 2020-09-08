class FavoritesController < ApplicationController

  def create
  	@book = Book.find(params[:book_id])
  	favorite = current_user.favorites.create(book_id: @book.id)
  end

  def destroy
  	book = Book.find(params[:book_id])
  	favorite = current_user.favorites.find_by(book_id: @book.id).destroy
  end

  private

  def book_params
    @book = Book.find(params[:id])
  end

end

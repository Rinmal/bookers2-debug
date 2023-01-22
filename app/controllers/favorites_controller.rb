class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    if favorite.save
      redirect_back fallback_location: root_path
    else
      redirect_to root_path, notice: "You're failed to favorite"
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    if favorite.destroy
      redirect_back fallback_location: root_path
    else
      redirect_to root_path, notice: "You're failed to cancel"
    end
  end
end

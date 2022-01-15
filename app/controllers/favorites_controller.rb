class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    #favorite = current_user.favorites.new(book_id: @book.id)
    favorite = @book.favorites.new(user_id: current_user.id)
    favorite.save
    #redirect_back(fallback_location: root_path) #非同期通信
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    #favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    #redirect_back(fallback_location: root_path) #非同期通信
  end

end

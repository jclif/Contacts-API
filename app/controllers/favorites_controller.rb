class FavoritesController < ApplicationController

  #index will look up favorites by user
  def index
    render :json => Contact.favorites_for_user_id(params[:user_id])
  end

  def create
    favorite = Favorite.new(params[:favorite])
    if favorite.save
      render :json => favorite
    else
      render :json => favorite.errors, :status => :unprocessable_entity
    end
  end


  def destroy
    if Favorite.find(params[:id]).nil?
      head :not_found
    else
      Favorite.delete(params[:id])
      head :ok
    end
  end
end

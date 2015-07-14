class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(favorite_params)

    if favorite.save
      render json: favorite
    else
      render json: favorite.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = Favorite.where(favorite_params)[0]
    fail unless favorite
    favorite.destroy!
    render json: favorite
  end

  private

  def favorite_params
    params.permit(:user_id, :contact_id)
  end
end

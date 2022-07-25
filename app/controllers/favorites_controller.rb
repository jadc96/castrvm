class FavoritesController < ApplicationController
  def index
    @favorites = policy_scope(Favorite)
  end

  def new
    @favorite = Favorite.new
    authorize @favorite
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, castle_id: params[:castle_id])
    @favorite.save!
    authorize @favorite
    flash[:alert] = "Ce château a bien été ajouté à vos favoris"
    redirect_back(fallback_location: castles_path)
  end

  def destroy
    @favorite = Favorite.where(user_id: current_user.id, castle_id: params[:castle_id])
    authorize @favorite
    @favorite[0].destroy
    flash[:alert] = "Supprimé des favoris"
    redirect_back(fallback_location: castles_path)
  end
end

class FavoritesController < ApplicationController
  def index
    @favorites = policy_scope(Favorite)
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, castle_id: params[:castle_id])
    @favorite.save!
    authorize @favorite
    redirect_to castle_path(params[:castle_id]), data: {turbo_method: "get"}
    flash[:alert] = "Ajouté à vos favoris"
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.destroy
    redirect_to castle_path(params[:castle_id]), status: :see_other
    flash[:alert] = "Supprimé des favoris"
  end
end

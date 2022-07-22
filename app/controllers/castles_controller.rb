class CastlesController < ApplicationController
  before_action :set_castle, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @castles = policy_scope(Castle)
    if params[:search].present?
      sql_query = "castles.name ILIKE :query OR castles.department ILIKE :query OR castles.city ILIKE :query"
      @castles = Castle.where(sql_query, query: "%#{params[:search]}%")
    end
    @markers = @castles.geocoded.map do |castle|
      {
        lat: castle.latitude,
        lng: castle.longitude,
        info_window: render_to_string(partial: "info_window", locals: { castle: castle })
      }
    end
  end

  def index_by_user
    @castles = Castle.where(user_id: params[:id])
    authorize @castles
  end

  def show
    authorize @castle
    @booking = Booking.new
  end

  def new
    @castle = Castle.new
    authorize @castle
  end

  def create
    @castle = Castle.new(params_castle)
    authorize @castle
    @castle.user = current_user
    if @castle.save
      redirect_to castle_path(@castle)
    else
      render :new
    end
  end

  def edit
    authorize @castle
  end

  def update
    authorize @castle
    @castle.update(params_castle)
    redirect_to castle_path(@castle)
  end

  def destroy
    authorize @castle
    @castle.destroy
    redirect_to castles_path, status: :see_other
  end

  private

  def set_castle
    @castle = Castle.find(params[:id])
  end

  def params_castle
    params.require(:castle).permit(:name, :description, :city, :price_per_day, photos: [])
  end
end

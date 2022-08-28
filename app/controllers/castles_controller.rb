class CastlesController < ApplicationController
  before_action :set_castle, only: %i[show full_screen edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show full_screen]

  def index
    @castles = policy_scope(Castle)
    @map = false
    if params[:search].present?
      sql_query = "castles.name ILIKE :query OR castles.department ILIKE :query OR castles.address ILIKE :query"
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
    @markers = [
      {
        lat: @castle.latitude,
        lng: @castle.longitude,
        info_window: render_to_string(partial: "info_window", locals: { castle: @castle })
      },
      {
        lat: @castle.latitude,
        lng: @castle.longitude,
        info_window: render_to_string(partial: "info_window", locals: { castle: @castle })
        }]
    @booking = Booking.new
    @review = Review.new
  end

  def full_screen
    authorize @castle
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @castle
  end

  def update
    authorize @castle
    if @castle.update(params_castle)
      redirect_to castle_path(@castle)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:castle).permit(:name, :subtitle, :description, :address, :department, :price_per_day, :number_of_bed, :smokers_welcome, :animals_welcome, :wifi, photos: [])
  end
end

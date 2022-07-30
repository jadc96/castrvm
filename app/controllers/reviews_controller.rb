class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    authorize @review
    @review.user_id = current_user.id
    @review.castle_id = params[:castle_id]
    if !params[:review][:reference].empty?
      if Booking.where(reference: params[:review][:reference]).empty?
        redirect_to castle_path(@review.castle), status: :unprocessable_entity
        flash[:alert] = "La référence que vous avez rentrée ne correspond à aucune réservation."
      elsif !Review.where(reference: params[:review][:reference]).empty?
        redirect_to castle_path(@review.castle), status: :unprocessable_entity
        flash[:alert] = "La référence de réservation que vous avez rentrée a déjà utilisée pour un commentaire sur ce lieu."
      else
        if @review.save!
          redirect_to castle_path(params[:castle_id])
        else
          render :new, status: :unprocessable_entity
        end
      end
    else
      if @review.save!
        redirect_to castle_path(params[:castle_id])
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(params_review)
      redirect_to castle_path(@review.castle_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @review
    castle = @review.castle
    @review.destroy
    redirect_to castle_path(castle), status: :see_other
    flash[:alert] = "Commentaire supprimé"
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def params_review
    params.require(:review).permit(:content, :rating, :user_id, :castle_id, :reference)
  end
end

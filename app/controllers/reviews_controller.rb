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
    if @review.save!
      redirect_to castle_path(params[:castle_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(params_review)
      redirect_to castle_path(@castle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to castle_path(@castle), status: :see_other
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def params_review
    params.require(:review).permit(:content, :rating, :user_id, :castle_id)
  end
end

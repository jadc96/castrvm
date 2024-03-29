class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]
  before_action :set_castle, only: :create

  def show
    authorize @booking
    @castle = @booking.castle
    @session = Stripe::Checkout::Session.retrieve(@booking.checkout_session_id)
    @booking.update(status: "paid") if @session.payment_status == "paid"
  end

  def create
    if user_signed_in? == false
      @booking = Booking.new
      authorize @booking
      redirect_to new_user_session_path
    else
      if booking_params[:start_date].empty? || booking_params[:end_date].empty? || booking_params[:number_of_guest].empty?
        @booking = Booking.new
        authorize @booking
        redirect_to castle_path(@castle.id), data: {turbo_method: "get"}
        flash.alert = "Toutes les champs doivent être remplis"
      else
        @booking = Booking.new(booking_params)
        @booking.castle_id = @castle.id
        @booking.user_id = current_user.id
        @booking.total_price = (@castle.price_per_day * ((Time.parse(@booking.end_date.to_s).to_i - Time.parse(@booking.start_date.to_s).to_i) / (60 * 60 * 24))) + 20
        authorize @booking

        if @booking.save!
          @booking.update(reference: generate_reference)

          @product = Stripe::Product.create(name: @castle.id)

          @price = Stripe::Price.create(
            product: @product.id,
            unit_amount: @booking.total_price * 100,
            currency: 'eur',
          )

          @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
              price: @price.id,
              quantity: 1
            }],
            mode: 'payment',
            success_url: booking_url(@booking),
            cancel_url: booking_url(@booking)
          )

          @booking.update(checkout_session_id: @session.id)
          @booking.update(status: "pending")
          redirect_to new_castle_booking_payment_path(@castle.id, @booking.id)
        else
          flash[:alert] = "Erreur, vérifiez les informations"
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
    if @booking.status == "pending"
      flash[:alert] = "Votre réservation a bien été annulée"
    else
      flash[:alert] = "Votre réservation a bien été supprimée de la liste"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:total_price, :start_date, :end_date, :number_of_guest)
  end

  def set_castle
    @castle = Castle.find(params[:castle_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def generate_reference
    random_char = ('A'..'Z').to_a
    reference = "#{Time.now.strftime("%d")}#{random_char.sample}#{random_char.sample}#{Time.now.strftime("%m")}#{random_char.sample}#{random_char.sample}#{Time.now.strftime("%Y")}-#{@booking.id}"
  end
end

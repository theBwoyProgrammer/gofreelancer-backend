class Api::V1::ReservationsController < ApplicationController
  before_action :set_user, only: [:index]
  def index
    render json: set_user.reservations, status: :ok
  end

  def create
    @freelancer = Freelancer.find(reservation_params[:freelancer_id])
    @reservation = Reservation.new(appointment_date: reservation_params[:appointment_date],
                                   user: set_user,
                                   freelancer: @freelancer)
    if @reservation.save
      render json: @reservation, status: :created, location: api_v1_freelancers_path
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @freelancer.destroy
    head :no_content
  end

  private

  def set_user
    current_user
  end

  def reservation_params
    params.require(:reservation).permit(:appointment_date, :freelancer_id)
  end
end

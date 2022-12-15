class Api::V1::SpecializationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  # before_action :set_data, only: %i[create]
  def index
    @specialization = Specialization.select('id', 'name')
    render json: @specialization, status: :ok
  end

  def create
    @specialization = Specialization.new(name: specialization_params[:name])
    if @specialization.save
      render json: @specialization, status: :created, location: api_v1_freelancers_path
    else
      render json: @specialization.errors, status: :unprocessable_entity
    end
  end

  private

  def specialization_params
    params.require(:specialization).permit(:name)
  end
end

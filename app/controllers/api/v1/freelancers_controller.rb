class Api::V1::FreelancersController < ApplicationController
  before_action :set_freelancer, only: %i[show destroy]

  def index
    render json: Freelancer.all, status: :ok
  end

  def show
    render json: @freelancer, status: :ok
  end

  def create
    @freelancer = Freelancer.new(freelancer_params)
    if @freelancer.save
      render json: @freelancer, status: :created, location: api_v1_freelancers_path
    else
      render json: @freelancer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @freelancer.destroy
    head :no_content
  end

  private

  def set_freelancer
    @freelancer = Freelancer.find(params[:id])
  end

  def freelancer_params
    params.require(:freelancer).permit(:name, :photo, :details, :fee, :location)
  end
end

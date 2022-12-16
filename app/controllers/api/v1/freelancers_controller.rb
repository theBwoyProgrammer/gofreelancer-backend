class Api::V1::FreelancersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_freelancer, only: %i[show destroy]
  def index
    render json: Freelancer.all, status: :ok
  end

  # user.as_json(include: { posts: {
  #   include: { comments: {
  #     only: :body } },
  #   only: :title } })
  def show
    render json: @freelancer, status: :ok
  end

  def create
    @freelancer = Freelancer.new(
      name: freelancer_params[:name],
      photo: freelancer_params[:photo],
      details: freelancer_params[:details],
      fee: freelancer_params[:fee],
      location: freelancer_params[:location],
      featured_image: freelancer_params[:featured_image]
    )

    list = freelancer_params[:specializations].split(',').map(&:to_i)
    list.each do |item|
      @freelancer.specializations << Specialization.find(item) if item != ''
    end
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
    params.require(:freelancer).permit(:name, :photo, :details, :fee, :location, :featured_image, :specializations)
  end
end

class Api::V1::SpecializationsController < ApplicationController
  def index
    @specializations = Specialization.all
    render json: @specializations
  end
end

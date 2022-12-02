class SpecializationsController < ApplicationController
    def index
        @specializations = Specialization.all
        render json: @specializations
    end
end

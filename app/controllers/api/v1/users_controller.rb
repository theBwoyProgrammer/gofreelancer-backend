class UsersController < ApplicationController
    skip_athentication_token only: [:create] 
end

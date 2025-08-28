 module Api
   module V1
    class UsersController < BaseController
       before_action :set_user, only: [:show, :update, :destroy]
       before_action :authorize_user, only: [:update, :destroy]
 
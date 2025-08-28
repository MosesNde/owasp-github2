 module Api
   module V1
    class UsersController < Api::V1::BaseController
       before_action :set_user, only: [:show, :update, :destroy]
       before_action :authorize_user, only: [:update, :destroy]
 
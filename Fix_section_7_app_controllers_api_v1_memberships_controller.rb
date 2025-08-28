 module Api
   module V1
    class MembershipsController < Api::V1::BaseController
       before_action :set_group
       before_action :ensure_user_in_group, except: [:create]
       before_action :set_membership, only: [:show, :update, :destroy]
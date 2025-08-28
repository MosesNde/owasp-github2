 module Api
   module V1
    class InvitationsController < Api::V1::BaseController
       before_action :set_group, only: [:index, :create]
       before_action :ensure_user_is_admin_of_group, only: [:index, :create]
       before_action :set_invitation, only: [:show, :destroy]
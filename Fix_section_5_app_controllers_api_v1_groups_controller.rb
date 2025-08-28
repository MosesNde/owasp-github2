 module Api
   module V1
    class GroupsController < Api::V1::BaseController
       before_action :set_group, only: [:show, :update, :destroy, :join, :leave]
       before_action :ensure_member, only: [:show]
       before_action :ensure_member_for_update_destroy, only: [:update, :destroy]
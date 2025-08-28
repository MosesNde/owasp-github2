 module Api
   module V1
    class GiftIdeasController < BaseController
      before_action :authenticate_user!
       before_action :set_gift_idea, only: [:show, :update, :destroy, :mark_as_buying, :mark_as_bought]
       before_action :authorize_access, only: [:show]
       before_action :authorize_modification, only: [:update, :destroy, :mark_as_buying, :mark_as_bought]
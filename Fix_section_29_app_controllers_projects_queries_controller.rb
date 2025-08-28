 
 class Projects::QueriesController < ApplicationController
   include Projects::QueryLoading
  include OpTurbo::ComponentStream
 
   # No need for a more specific authorization check. That is carried out in the contracts.
   no_authorization_required! :show, :new, :create, :rename, :update, :toggle_public, :destroy
     render_result(call, success_i18n_key: "lists.update.success", error_i18n_key: "lists.update.failure")
   end
 
  def toggle_public # rubocop:disable Metrics/AbcSize
    to_be_public = ActiveRecord::Type::Boolean.new.cast(params["value"])
     i18n_key = to_be_public ? "lists.publish" : "lists.unpublish"
 
     call = Queries::Projects::ProjectQueries::PublishService
              .new(user: current_user, model: @query)
              .call(public: to_be_public)
 
    respond_to do |format|
      format.turbo_stream do
        # Load shares and replace the modal
        strategy = SharingStrategies::ProjectQueryStrategy.new(@query, user: current_user, query_params: {})
        replace_via_turbo_stream(component: Shares::ModalBodyComponent.new(strategy:, errors: []))
        render turbo_stream: turbo_streams
      end

      format.html do
        render_result(call, success_i18n_key: "#{i18n_key}.success", error_i18n_key: "#{i18n_key}.failure")
      end
    end
   end
 
   def destroy
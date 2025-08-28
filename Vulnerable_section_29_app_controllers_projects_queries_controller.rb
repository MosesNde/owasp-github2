 
 class Projects::QueriesController < ApplicationController
   include Projects::QueryLoading
 
   # No need for a more specific authorization check. That is carried out in the contracts.
   no_authorization_required! :show, :new, :create, :rename, :update, :toggle_public, :destroy
     render_result(call, success_i18n_key: "lists.update.success", error_i18n_key: "lists.update.failure")
   end
 
  def toggle_public
    to_be_public = !@query.public?
     i18n_key = to_be_public ? "lists.publish" : "lists.unpublish"
 
     call = Queries::Projects::ProjectQueries::PublishService
              .new(user: current_user, model: @query)
              .call(public: to_be_public)
 
    render_result(call, success_i18n_key: "#{i18n_key}.success", error_i18n_key: "#{i18n_key}.failure")
   end
 
   def destroy
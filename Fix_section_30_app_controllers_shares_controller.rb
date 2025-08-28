   include MemberHelper
 
   before_action :load_entity
   before_action :load_selected_shares, only: %i[bulk_update bulk_destroy]
   before_action :load_share, only: %i[destroy update resend_invite]
   before_action :enterprise_check, only: %i[index]
   def dialog; end
 
   def index
    unless sharing_strategy.query.valid?
      flash.now[:error] = sharing_strategy.query.errors.full_messages
     end
 
    render Shares::ModalBodyComponent.new(strategy: sharing_strategy, errors: @errors), layout: nil
   end
 
   def create # rubocop:disable Metrics/AbcSize,Metrics/PerceivedComplexity
     overall_result = []
     @errors = ActiveModel::Errors.new(self)
 
    visible_shares_before_adding = sharing_strategy.shares.present?

     find_or_create_users(send_notification: false) do |member_params|
       user = User.find_by(id: member_params[:user_id])
       if user.present? && user.locked?
       end
     end
 
    new_shares = overall_result.map(&:result).reverse
 
     if overall_result.present?
      # In case we did not have shares before we have to replace the modal to get rid of the blankstate,
      # otherwise we can prepend the new shares
      if visible_shares_before_adding
        respond_with_prepend_shares(new_shares)
       else
         respond_with_replace_modal
       end
   def update
     create_or_update_share(@share.principal.id, params[:role_ids])
 
    shares = sharing_strategy.shares(reload: true)
 
    if shares.empty?
       respond_with_replace_modal
    elsif shares.include?(@share)
       respond_with_update_permission_button
     else
       respond_with_remove_share
   def destroy
     destroy_share(@share)
 
    # When we removed the last share we have to replace the modal to show the blankstate
    if sharing_strategy.shares(reload: true).empty?
       respond_with_replace_modal
     else
       respond_with_remove_share
     end
   end
 
  # TODO: This is still work package specific
   def resend_invite
     OpenProject::Notifications.send(OpenProject::Events::WORK_PACKAGE_SHARED,
                                     work_package_member: @share,
   def bulk_update
     @selected_shares.each { |share| create_or_update_share(share.principal.id, params[:role_ids]) }
 
    respond_with_bulk_updated_permission_buttons(@selected_shares)
   end
 
   def bulk_destroy
     @selected_shares.each { |share| destroy_share(share) }
 
    if sharing_strategy.shares(reload: true).empty?
       respond_with_replace_modal
     else
      respond_with_bulk_removed_shares(@selected_shares)
     end
   end
 
   end
 
   def respond_with_replace_modal
    sharing_strategy.shares(reload: true)

     replace_via_turbo_stream(
       component: Shares::ModalBodyComponent.new(
         strategy: sharing_strategy,
         errors: @errors
       )
     )
 
     respond_with_turbo_streams
   end
 
  def respond_with_prepend_shares(new_shares)
     replace_via_turbo_stream(
       component: Shares::InviteUserFormComponent.new(
         strategy: sharing_strategy,
     update_via_turbo_stream(
       component: Shares::CounterComponent.new(
         strategy: sharing_strategy,
        count: sharing_strategy.shares(reload: true).count
       )
     )
 
    new_shares.each do |share|
       prepend_via_turbo_stream(
         component: Shares::ShareRowComponent.new(
           share:,
           strategy: sharing_strategy
         ),
         target_component: Shares::ModalBodyComponent.new(
           strategy: sharing_strategy,
           errors: @errors
         )
       )
     replace_via_turbo_stream(
       component: Shares::PermissionButtonComponent.new(
         share: @share,
        strategy: sharing_strategy,
         data: { "test-selector": "op-share-dialog-update-role" }
       )
     )
     update_via_turbo_stream(
       component: Shares::CounterComponent.new(
         strategy: sharing_strategy,
        count: sharing_strategy.shares(reload: true).count
       )
     )
 
     update_via_turbo_stream(
       component: Shares::UserDetailsComponent.new(
         share: @share,
        strategy: sharing_strategy,
         invite_resent: true
       )
     )
 
     respond_with_turbo_streams
   end
 
  def respond_with_bulk_updated_permission_buttons(selected_shares)
    selected_shares.each do |share|
       replace_via_turbo_stream(
         component: Shares::PermissionButtonComponent.new(
           share:,
          strategy: sharing_strategy,
           data: { "test-selector": "op-share-dialog-update-role" }
         )
       )
     respond_with_turbo_streams
   end
 
  def respond_with_bulk_removed_shares(selected_shares)
    selected_shares.each do |share|
       remove_via_turbo_stream(
         component: Shares::ShareRowComponent.new(
           share:,
 
     update_via_turbo_stream(
       component: Shares::CounterComponent.new(
        count: sharing_strategy.shares(reload: true).count,
         strategy: sharing_strategy
       )
     )
   def load_entity # rubocop:disable Metrics/AbcSize
     if params["work_package_id"]
       @entity = WorkPackage.visible.find(params["work_package_id"])
      @sharing_strategy = SharingStrategies::WorkPackageStrategy.new(@entity, user: current_user, query_params:)
     elsif params["project_query_id"]
       @entity = ProjectQuery.visible.find(params["project_query_id"])
      @sharing_strategy = SharingStrategies::ProjectQueryStrategy.new(@entity, user: current_user, query_params:)
     else
       raise ArgumentError, <<~ERROR
         Nested the SharesController under an entity controller that is not yet configured to support sharing.
         Request Path: #{request.path}
       ERROR
     end
   end
 
   def load_share
     @share = @entity.members.find(params[:id])
   end
 
   def load_selected_shares
     @selected_shares = Member.includes(:principal)
                              .of_entity(@entity)
                              .where(id: params[:share_ids])
   end

  def query_params
    params
      .slice(:filters, :sortBy, :groupBy)
      .permit! # ParamsToQueryService will parse the data, so we can permit everything here
  end
 end
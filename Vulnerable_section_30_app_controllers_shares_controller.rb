   include MemberHelper
 
   before_action :load_entity
  before_action :load_shares, only: %i[index dialog]
   before_action :load_selected_shares, only: %i[bulk_update bulk_destroy]
   before_action :load_share, only: %i[destroy update resend_invite]
   before_action :enterprise_check, only: %i[index]
   def dialog; end
 
   def index
    unless @query.valid?
      flash.now[:error] = query.errors.full_messages
     end
 
    render Shares::ModalBodyComponent.new(strategy: sharing_strategy, shares: @shares, errors: @errors), layout: nil
   end
 
   def create # rubocop:disable Metrics/AbcSize,Metrics/PerceivedComplexity
     overall_result = []
     @errors = ActiveModel::Errors.new(self)
 
     find_or_create_users(send_notification: false) do |member_params|
       user = User.find_by(id: member_params[:user_id])
       if user.present? && user.locked?
       end
     end
 
    @new_shares = overall_result.map(&:result).reverse
 
     if overall_result.present?
      # In case the number of newly added shares is equal to the whole number of shares,
      # we have to render the whole modal again to get rid of the blankslate
      if current_visible_member_count > 1 && @new_shares.size < current_visible_member_count
        respond_with_prepend_shares
       else
         respond_with_replace_modal
       end
   def update
     create_or_update_share(@share.principal.id, params[:role_ids])
 
    load_shares
 
    if @shares.empty?
       respond_with_replace_modal
    elsif @shares.include?(@share)
       respond_with_update_permission_button
     else
       respond_with_remove_share
   def destroy
     destroy_share(@share)
 
    if current_visible_member_count.zero?
       respond_with_replace_modal
     else
       respond_with_remove_share
     end
   end
 
   def resend_invite
     OpenProject::Notifications.send(OpenProject::Events::WORK_PACKAGE_SHARED,
                                     work_package_member: @share,
   def bulk_update
     @selected_shares.each { |share| create_or_update_share(share.principal.id, params[:role_ids]) }
 
    respond_with_bulk_updated_permission_buttons
   end
 
   def bulk_destroy
     @selected_shares.each { |share| destroy_share(share) }
 
    if current_visible_member_count.zero?
       respond_with_replace_modal
     else
      respond_with_bulk_removed_shares
     end
   end
 
   end
 
   def respond_with_replace_modal
     replace_via_turbo_stream(
       component: Shares::ModalBodyComponent.new(
         strategy: sharing_strategy,
        shares: @new_shares || load_shares,
         errors: @errors
       )
     )
 
     respond_with_turbo_streams
   end
 
  def respond_with_prepend_shares
     replace_via_turbo_stream(
       component: Shares::InviteUserFormComponent.new(
         strategy: sharing_strategy,
     update_via_turbo_stream(
       component: Shares::CounterComponent.new(
         strategy: sharing_strategy,
        count: current_visible_member_count
       )
     )
 
    @new_shares.each do |share|
       prepend_via_turbo_stream(
         component: Shares::ShareRowComponent.new(
           share:,
           strategy: sharing_strategy
         ),
         target_component: Shares::ModalBodyComponent.new(
           strategy: sharing_strategy,
          shares: load_shares,
           errors: @errors
         )
       )
     replace_via_turbo_stream(
       component: Shares::PermissionButtonComponent.new(
         share: @share,
        available_roles: sharing_strategy.available_roles,
         data: { "test-selector": "op-share-dialog-update-role" }
       )
     )
     update_via_turbo_stream(
       component: Shares::CounterComponent.new(
         strategy: sharing_strategy,
        count: current_visible_member_count
       )
     )
 
     update_via_turbo_stream(
       component: Shares::UserDetailsComponent.new(
         share: @share,
        manager_mode: sharing_strategy.manageable?,
         invite_resent: true
       )
     )
 
     respond_with_turbo_streams
   end
 
  def respond_with_bulk_updated_permission_buttons
    @selected_shares.each do |share|
       replace_via_turbo_stream(
         component: Shares::PermissionButtonComponent.new(
           share:,
          available_roles: sharing_strategy.available_roles,
           data: { "test-selector": "op-share-dialog-update-role" }
         )
       )
     respond_with_turbo_streams
   end
 
  def respond_with_bulk_removed_shares
    @selected_shares.each do |share|
       remove_via_turbo_stream(
         component: Shares::ShareRowComponent.new(
           share:,
 
     update_via_turbo_stream(
       component: Shares::CounterComponent.new(
        count: current_visible_member_count,
         strategy: sharing_strategy
       )
     )
   def load_entity # rubocop:disable Metrics/AbcSize
     if params["work_package_id"]
       @entity = WorkPackage.visible.find(params["work_package_id"])
      @sharing_strategy = SharingStrategies::WorkPackageStrategy.new(@entity, user: current_user)
     elsif params["project_query_id"]
       @entity = ProjectQuery.visible.find(params["project_query_id"])
      @sharing_strategy = SharingStrategies::ProjectQueryStrategy.new(@entity, user: current_user)
     else
       raise ArgumentError, <<~ERROR
         Nested the SharesController under an entity controller that is not yet configured to support sharing.
         Request Path: #{request.path}
       ERROR
     end

    if @entity.respond_to?(:project)
      @project = @entity.project
    end
   end
 
   def load_share
     @share = @entity.members.find(params[:id])
   end
 
  def current_visible_member_count
    @current_visible_member_count ||= load_shares.size
  end

  def load_query
    return @query if defined?(@query)

    @query = ParamsToQueryService
               .new(Member, current_user, query_class: Queries::Members::NonInheritedMemberQuery)
               .call(params)

    # Set default filter on the entity
    @query.where("entity_id", "=", @entity.id)
    @query.where("entity_type", "=", @entity.class.name)
    if @project
      @query.where("project_id", "=", @project.id)
    end

    @query.order(name: :asc) unless params[:sortBy]

    @query
  end

  def load_shares
    @shares = load_query.results
  end

   def load_selected_shares
     @selected_shares = Member.includes(:principal)
                              .of_entity(@entity)
                              .where(id: params[:share_ids])
   end
 end
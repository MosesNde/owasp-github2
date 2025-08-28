   include Accounts::UserPasswordChange
   include ActionView::Helpers::TagHelper
   include OpTurbo::ComponentStream
 
   layout "my"
 
     result = APITokens::CreateService.new(user: current_user).call(token_name: params[:token_api][:token_name])
 
     result.on_success do |r|
      flash[:info] = [
        t("my.access_token.notice_reset_token", type: "API").html_safe,
        content_tag(:strong, r.result.plain_value),
        t("my.access_token.token_value_warning")
      ]
 
       redirect_to action: "access_token"
     end
       respond_with_turbo_streams
     end
   end
   # rubocop:enable Metrics/AbcSize
 
   # rubocop:disable Metrics/AbcSize
 
     # rubocop:disable Rails/ActionControllerFlashBeforeRender
     result.on_success do
      flash[:info] = t("my.access_token.notice_api_token_revoked")
     end
 
    result.on_failure do
      Rails.logger.error "Failed to revoke api token ##{current_user.id}: #{e}"
      flash[:error] = t("my.access_token.failed_to_revoke_token", error: e.message)
     end
     # rubocop:enable Rails/ActionControllerFlashBeforeRender
 
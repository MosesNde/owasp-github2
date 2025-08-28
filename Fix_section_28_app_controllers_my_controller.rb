   include Accounts::UserPasswordChange
   include ActionView::Helpers::TagHelper
   include OpTurbo::ComponentStream
  include FlashMessagesOutputSafetyHelper
 
   layout "my"
 
     result = APITokens::CreateService.new(user: current_user).call(token_name: params[:token_api][:token_name])
 
     result.on_success do |r|
      flash[:primer_banner] = {
        scheme: :success,
        message: join_flash_messages(
          [
            t("my.access_token.notice_reset_token", type: "API"),
            Primer::Beta::Text.new(font_weight: :bold).render_in(view_context) { r.result.plain_value },
            t("my.access_token.token_value_warning")
          ]
        )
      }
 
       redirect_to action: "access_token"
     end
       respond_with_turbo_streams
     end
   end

   # rubocop:enable Metrics/AbcSize
 
   # rubocop:disable Metrics/AbcSize
 
     # rubocop:disable Rails/ActionControllerFlashBeforeRender
     result.on_success do
      flash[:primer_banner] = { message: t("my.access_token.notice_api_token_revoked") }
     end
 
    result.on_failure do |r|
      error = r.errors.map(&:message).join("; ")
      Rails.logger.error("Failed to revoke api token ##{current_user.id}: #{error}")
      flash[:primer_banner] = { message: t("my.access_token.failed_to_revoke_token", error:), scheme: :danger }
     end
     # rubocop:enable Rails/ActionControllerFlashBeforeRender
 
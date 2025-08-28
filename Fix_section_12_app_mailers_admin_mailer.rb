 # typed: true
class AdminMailer < ApplicationMailer
   extend T::Sig
 
  sig { params(admin: Admin, token: String).void }
 
  def on_create(admin, token)
    @admin = admin
     @token = T.let(token, T.nilable(String))
 
     bootstrap_mail(
      to: @admin[:email],
      subject: t("layout.mailing.subject.admin_created"),
     )
   end
 
  sig { params(admin: Admin).returns(T.untyped) }
 
  def on_update(admin)
    @admin = T.let(admin, T.nilable(Admin))
 
    if @admin.nil?
      raise "Admin cannot be null"
     end
 
     bootstrap_mail(
      to: @admin[:email],
      subject: t("layout.mailing.subject.admin_updated"),
     )
   end
 
     bootstrap_mail(
       from: from_email,
       to: to_email,
      subject: t("layout.mailing.subject.message_to", admin_from: from_name),
     )
   end
 end
 # typed: true
class UserMailer < ApplicationMailer
   extend T::Sig
 
  sig { params(user: User, token: String).void }
 
  def on_create(user, token)
    @user = user
     @token = T.let(token, T.nilable(String))
 
     bootstrap_mail(
      to: @user[:email],
      subject: t("layout.mailing.subject.user_created"),
     )
   end
 
  sig { params(user: User).returns(T.untyped) }
 
  def on_update(user)
    @user = T.let(user, T.nilable(User))
 
    if @user.nil?
      raise "User cannot be null"
     end
 
     bootstrap_mail(
      to: @user[:email],
      subject: t("layout.mailing.subject.user_updated"),
     )
   end
 
     bootstrap_mail(
       from: from_email,
       to: to_email,
      subject: t("layout.mailing.subject.message_to", user_from: from_name),
     )
   end
 end
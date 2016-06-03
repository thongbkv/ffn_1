class UserMailer < ApplicationMailer
  def send_email_notify_bet bet_id, user_id, current_user_id
    @bet = Bet.find bet_id
    @user = User.find user_id
    @current_user = User.find current_user_id

    mail from: @user.email, to: @current_user.email,
      subject: t("bet.mailer.betted_success")
  end
end

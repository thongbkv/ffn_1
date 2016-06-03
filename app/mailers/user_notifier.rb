class UserNotifier < ApplicationMailer
  default from: I18n.t("mailer.edu_football_news_sys")
  def send_admin_email admin, current_user
    @current_user = current_user
    @admin = admin
    mail from: admin.email, to: current_user.email,
      subject: I18n.t("mailer.notifier")
  end
end

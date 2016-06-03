class SendEmailWorker
  include Sidekiq::Worker

  def perform bet_id, user_id, current_user_id
    UserMailer.send_email_notify_bet(bet_id, user_id, current_user_id).deliver
  end
end

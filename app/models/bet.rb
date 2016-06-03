class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  enum status: [:win, :tie, :fail]

  after_save :send_mail

  def is_win_of_team? team_id
    self.team_id == team_id
  end

  def send_mail
    admin = User.admin.first
    SendEmailWorker.perform_async self.id, admin.id, self.user_id
  end
end

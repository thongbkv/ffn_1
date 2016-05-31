class Comment < ActiveRecord::Base
  has_many :replies

  belongs_to :post
  belongs_to :user

  mount_uploader :image, LogoUploader

  delegate :name, to: :user, prefix: true

  validates :content, presence: true

  def is_of_user? user
    self.user == user
  end
end

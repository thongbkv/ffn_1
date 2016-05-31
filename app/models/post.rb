class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :season
  belongs_to :match

  validates :title,  presence: true
  validates :content,  presence: true

  mount_uploader :image, LogoUploader

  delegate :name, to: :season, prefix: true
  delegate :name, to: :match, prefix: true

  scope :order_by_date, ->{order created_at: :desc}
end

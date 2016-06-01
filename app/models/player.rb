class Player < ActiveRecord::Base
  belongs_to :team

  validates :name, presence: true, length: {maximum: 50}
  validates :position, presence: true, length: {maximum: 20}
  validates :nationality, presence: true, length: {maximum: 20}
  validates :jersey_number, presence: true,
    numericality: {only_integer: true, greater_than: 0}

  mount_uploader :image, LogoUploader  
end

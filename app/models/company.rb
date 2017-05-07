class Company < ApplicationRecord
  before_validation :slugit

  mount_uploader :logo, LogoUploader

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :user_companies
  has_many :users, through: :user_companies

  def slugit
    return if slug
    self.slug = name.downcase().gsub(/ /, "-").gsub(/,/,"").gsub(/\./,"")
  end
end


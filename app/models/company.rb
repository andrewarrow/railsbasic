class Company < ApplicationRecord
  before_validation :slugit

  mount_uploader :logo, LogoUploader

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  def slugit
    return if slug
    self.slug = name.downcase().gsub(/ /, "-").gsub(/,/,"").gsub(/\./,"")
  end

end


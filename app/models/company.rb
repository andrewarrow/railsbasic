class Company < ApplicationRecord
  before_validation :slugit

  mount_uploader :logo, LogoUploader

  def slugit
    return if slug
    self.slug = name.downcase().gsub(/ /, "-").gsub(/,/,"").gsub(/\./,"")
  end

end


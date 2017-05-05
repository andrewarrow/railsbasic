class Company < ApplicationRecord
  before_validate :slugit

  def slugit
    return if slug
    self.slug = name.downcase().gsub(/ /, "-").gsub(/,/,"").gsub(/\./,"")
  end

end


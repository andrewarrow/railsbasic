class Company < ApplicationRecord
  before_validation :slugit

  def slugit
    return if slug
    self.slug = name.downcase().gsub(/ /, "-").gsub(/,/,"").gsub(/\./,"")
  end

end


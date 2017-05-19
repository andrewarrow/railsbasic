class User < ApplicationRecord
  before_validation :slugit

  has_many :user_companies
  has_many :companies, through: :user_companies

  def slugit
    return if slug
    self.slug = name.downcase().gsub(/ /, "-").gsub(/,/,"").gsub(/\./,"")
  end
  
  def self.ranpas
    'RB'+rand(999999999999999999999999999999999999999999999999999999).to_s+'!'
  end

  def name
    fname + ' ' + lname
  end
  
  def self.ran_img
   i=%w{blur.jpg car.jpg cliff.jpg home.jpg house.jpg party.jpg pizza.jpg red_car.jpg table.jpg trees.jpg}
   i[rand(i.size)-1]
  end
end

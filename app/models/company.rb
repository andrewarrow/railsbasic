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

  def cto
    user_companies.each do |uc|
      return uc.user if uc.role == 'cto'
    end
    nil
  end

  def self.stages
    [['1 - just formed', 1],
    ['2 - got cto, been coding for weeks',2],
    ['3 - live but zero traffic', 3],
    ['4 - live with > 0 traffic', 4],
    ['5 - having scaling issues', 5],
    ['6 - profitable', 6]]
  end
end


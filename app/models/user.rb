class User < ApplicationRecord
  def self.ranpas
    'RB'+rand(999999999999999999999999999999999999999999999999999999).to_s+'!'
  end

  def name
    fname + ' ' + lname
  end
end

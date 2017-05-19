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
   'party.jpg'
   i[rand(i.size)-1]
   'blue.jpg'
  end

	def self.lorum1
		'But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?'
	end

	def self.lorum2
		'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.'
	end
end

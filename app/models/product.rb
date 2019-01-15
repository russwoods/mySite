class Product < ApplicationRecord
  has_many :orders    
  has_many :comments, dependent: :destroy
    
  validates :name, presence: true    
    
  def self.search(search_term)
		if Rails.env.development?
    	Product.where("name LIKE ? OR description LIKE ? OR color LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
		else
			Product.where("name ilike ?", "%#{search_term}%")
		end	
  end

  def average_rating
    comments.average(:rating).to_f
  end  
    
  def highest_rating_comment
    comments.rating_desc.first
  end
    
  def lowest_rating_comment
    comments.rating_asc.first
  end  
    
end
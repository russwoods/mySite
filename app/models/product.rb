class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
    
  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end

  def average_rating
    comments.average(:rating).to_f
  end  
    
  def highest_rating_comment
    comments.rating_desc.first
  end
    
end
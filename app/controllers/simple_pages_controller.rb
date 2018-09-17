class SimplePagesController < ApplicationController
  def index
  end
    
  def landing_page 
    @products = Product.limit(4)
  end    
    
end



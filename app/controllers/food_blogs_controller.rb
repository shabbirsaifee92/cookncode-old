class FoodBlogsController < ApplicationController
  layout 'food_blog'  
  def index
    @page_title = 'CookNCode Food blog'
  end
end
class PagesController < ApplicationController
  def home
    @blogs = Blog.all
    @skills = Skill.all
  end

  def contact
  end

  def about
  end
end

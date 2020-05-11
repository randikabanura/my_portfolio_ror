class PagesController < ApplicationController

  def home; end
  
  def blog
    @blog = Blog.friendly.find(params[:id])
  end
end

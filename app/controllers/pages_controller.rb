class PagesController < ApplicationController

  def home; end
  
  def blog
    @blog = Blog.friendly.find(params[:id])

    posts = Blog.active.where.not(id: @blog.id).order(:created_at).last(6)

    @other_posts = if posts.size.positive?
                     posts.each_slice((posts.size / 2.0).round).to_a
                   else
                     nil
                   end
  end
end

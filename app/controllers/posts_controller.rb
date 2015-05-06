class PostsController < ApplicationController
  def show
  	@posts = Post.where(user: current_user)
  end
end

class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    @user = User.find_by({"id"=>session["user_id"]})
    if @user != nil
      @post = Post.new
      @post["body"] = params["body"]
      @post["image"] = params["image"]
      @post.save
    else
      flash["notice"]="Please Login"
    end
    redirect_to "/posts"
  end
end

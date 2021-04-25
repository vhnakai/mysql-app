class PostsController < ApplicationController
  before_action :authenticate_user!
    # def create
    #     @post = Post.new(params[:post].permit(:topic_id, :name, :body))
    #     @post.save
    #     redirect_to topics_show_path(params[:post]['topic_id'])
    #   end


  def create
    @post = Post.new(params[:post].permit(:topic_id,:body))
    @post.user_id = current_user.id
    if @post.save
      # redirect_to topics_show_path(id: current_user) 
      # redirect_to topics_index_path
      redirect_to topics_show_path(params[:post]['topic_id'])
    else
      render :show
    end
  end
  
    # def show
    #  @post = Post.new
    #  @posts = Post.all
    # end
  
    private
    def post_params
     params.require(:post).permit(:body)
    end
end

class TopicsController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user,{only: [:delete]}
  
  def index
    @topics = Topic.all
    @newTopic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(:topic_id => params[:id])
    @posts = Post.where(topic_id: params[:id])
    # @post = Post.new
    # @posts = Post.find(topic_id: params[:id])
  end

  def create   
    # user_id = current_user.id 
    # @topic = Topic.new(
    #   params.require(:topic).permit(:title,:user_id))
    @topic = current_user.topics.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_index_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to topics_index_path
  end

  # def ensure_correct_user
  #   @topic = Topic.find(params[:id])
  #   if @current_user.id != @Topic.user_id
  #     flash[:notice] = "権限がありません"
  #     redirect_to("/Topics/index")
  #   end
  # end

  private
  def topic_params
    # params.require(:topic).permit(:title).merge(user_id: current_user.id)
    params.require(:topic).permit(:title)

  end
  
end

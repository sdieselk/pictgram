class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users, :comments)
    
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: "投稿に成功しました"
    else
      flash.now[:danger] ="投稿に失敗しました"
      render :new
    end
  end
  
  def comment
    @comment = Comment.new(
      content: params[:comment], 
      topic_id: params[:topic_id], 
      user_id: params[:user_id]
    )
    if  @comment.save
      redirect_to topics_path, success: "投稿に成功しました"
    else
      redirect_to topics_path, danger: "投稿に失敗しました"
    end    

  end

  
  private
  def topic_params
    params.require(:topic).permit(:image, :description, :content)
  end
  
end

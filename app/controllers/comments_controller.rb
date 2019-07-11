class CommentsController < ApplicationController

  
  def new
    @topic = Topic.find_by(params[:topic_id])
    @comment = Comment.new
  end
  
  def create
    # @comment = Comment.new(comment_params)
    @comment = current_user.comments.new(comment_params)
    # @comment.topic_id = params[:topic_id]
    @comments = @comment.all.find_by(topic_id: topic.id)
       
    if @comment.save
      redirect_to topics_path, success: 'コメントに成功しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id, :user_id)
  end

end

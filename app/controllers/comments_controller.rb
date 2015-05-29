class CommentsController < ApplicationController
  def create
    ## commnet added to save destroy assignment branch delete this
    @post = Post.find(params[:post_id])
    @topic = @post.topic
  	@comment = @post.comments.new(comment_params)
  	@comment.user = current_user

  	authorize @comment
  	if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
  	end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

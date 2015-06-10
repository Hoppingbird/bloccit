class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite

    if favorite.save
      flash[:notice] = "Marked as Favorite sucessfully"
      redirect_to [post.topic, post]
    else
      flash[:notice] = "Mark as Favorite failed, please try again"
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.destroy(post: post)
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Favorite deleted sucessfully"
      redirect_to [post.topic, post]
    else
      flash[:notice] = "Favorite delete failed, please try again"
      redirect_to [post.topic, post]
    end
  end
end



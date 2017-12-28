class AdminController < ApplicationController
  def index
    @users = User.all
  end

  def posts
    @posts = Post.all
  end

  def posts_destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/admin/posts'
  end

  def reviews
    @reviews = Review.all
  end

  def reviews_destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to '/admin/reviews'
  end

  def to_admin
    user = User.find(params[:id])
    user.update(
      role: "admin"
    )
    flash[:notice] = "관리자로 변경되었습니다."
    redirect_to :back, notice: "관리자로 변경되었습니다."
  end

  def to_manager
    user = User.find(params[:id])
    user.update(
      role: "manager"
    )
    flash[:notice] = "매니저로 변경되었습니다."
    redirect_to :back, notice: "매니저로 변경되었습니다."
  end

  def to_user
    user = User.find(params[:id])
    user.update(
      role: "user"
    )
    flash[:notice] = "양민으로 변경되었습니다."
    redirect_to :back, notice: "양민으로 변경되었습니다."
  end
end

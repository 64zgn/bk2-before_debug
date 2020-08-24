class RelationshipsController < ApplicationController
	def create
    user = User.find(params[:relationship][:follow_id])
    p current_user.id
    p user.id
    if current_user.follow(user)
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to user
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user
    end
  end
end
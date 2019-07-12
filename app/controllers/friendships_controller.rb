class FriendshipsController < ApplicationController
	def destroy
		friendship = Friendship.find(params[:id])
		friendship.destroy
		flash[:warning] = "You are not  #{friendship.friend.full_name}'s friend any more."
		redirect_to my_friends_path
	end
	def create
		if Friendship.create(user_id:params[:user_id], friend_id: params[:friend_id])
			flash[:success] = "Friend is successfully added."
	      else
	        flash.now[:danger] = "Friends failed."
	      end
	      redirect_to my_friends_path
	end
end
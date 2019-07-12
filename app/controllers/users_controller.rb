class UsersController < ApplicationController
  def my_portfolio
    @user_stocks = current_user.user_stocks
    @user = current_user
  end

  def my_friends
  	@friendships = current_user.friendships
  end

  def search  	
  	 if params[:keywords].blank?
        flash.now[:danger] = "Please enter a valid keyword to search."
    else
      @users= User.search(params[:keywords])
      flash.now[:danger] = "No such users." if @users.blank?
    end  
    
    #render partial: 'users/search_result' #rails 4
   respond_to do |format|
      format.js { render partial: 'users/users_result' }
    end
  end

  def show
    @user = User.find(params[:id])
    @user_stocks=@user.user_stocks
  end
end
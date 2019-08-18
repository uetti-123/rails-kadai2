class UsersController < ApplicationController
	before_action :authenticate_user!

	before_action :current_user_check, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  	@book = Book.new
  end
  
  def edit
  	@user = User.find(params[:id])
  end
  
  def update
  	@user = User.find(params[:id])
  if  @user.update(user_params)
  	flash[:notice] = "successfully!!"
    redirect_to user_path(@user)
  else
  	flash[:notice] = "error!"
  	render ("users/edit")
  end
  end

  def index
  	@book = Book.new
  	@user = current_user
  	@users = User.all
  end
  
  private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def current_user_check
    	user = User.find(params[:id])
    	if current_user != user
    		redirect_to user_path(current_user)
    	end
    end

end

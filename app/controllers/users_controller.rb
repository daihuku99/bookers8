class UsersController < ApplicationController
	layout 'users'
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
	def index
		@users = User.all
		@user = current_user
		@book_image_new = BookImage.new
	end

	def show
		@user = User.find(params[:id])
		# binding.pry
		@book_images = @user.book_images
		@book_image_new = BookImage.new
		@photos = current_user.photos
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: 'You have update your profile successfully.'
		else
			render :edit
		end
	end

	def correct_user
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to users_path
		end
	end

	def search
		if params[:name].present?
			@users = User.where('name LIKE ?', "%#{params[:name]}%")
		else
			@users = User.none
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end

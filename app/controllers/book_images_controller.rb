class BookImagesController < ApplicationController
	layout 'books'
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update, :destroy]
	def create
		# @book_image_new = BookImage.new(book_image_params)
		# @book_image_new.user_id = current_user.id
		@book_image_new = current_user.book_images.new(book_image_params)
		if @book_image_new.save
		   redirect_to book_image_path(@book_image_new.id), notice: 'You have creatad book successfully.'
		else
			@book_images = BookImage.all
			render :index
		end
	end

	def index
		@book_images = BookImage.all
		@book_image_new = BookImage.new
		@user = current_user
		# book_comment = book_image.book_comment
	end

	def show
		@book_image = BookImage.find(params[:id])
		@book_image_new = BookImage.new
		# binding.pry
		@user = BookImage.find(params[:id]).user
		@book_comment = BookComment.new
	end

	def edit
		@book_image = BookImage.find(params[:id])
	end

	def update
		@book_image = BookImage.find(params[:id])
		if @book_image.update(book_image_params)
		   redirect_to book_image_path(@book_image.id), notice: 'You have updated book successfully.'
		else
			render :edit
		end
	end

	def destroy
		book_image = BookImage.find(params[:id])
		book_image.destroy
		redirect_to book_images_path
	end

	def correct_user
		@book_image = BookImage.find(params[:id])
		if @book_image.user.id != current_user.id
			redirect_to book_images_path
		end
	end

	def search
		if params[:title].present?
			@book_images = BookImage.where('title LIKE ?', "%#{params[:title]}%")
		else
			@book_iamges = BookImage.none
		end
	end

	private
	def book_image_params
		params.require(:book_image).permit(:title, :body, :image)
	end

end

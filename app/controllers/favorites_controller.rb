class FavoritesController < ApplicationController
	def create
		@book_image = BookImage.find(params[:book_image_id])
		favorite = Favorite.new
		favorite.user_id = current_user.id
		favorite.book_image_id = @book_image.id
		if @book_image.favorites.where(user_id: current_user.id).exists?
			redirect_to book_image_path(@book_image)
		else
			favorite.save
		end
		# redirect_to book_image_path(book_image)
	end

	def destroy
		@book_image = BookImage.find(params[:book_image_id])
		favorite = current_user.favorites.find_by(book_image_id: @book_image.id)
		favorite.destroy
		# redirect_to book_image_path(book_image)
	end
end

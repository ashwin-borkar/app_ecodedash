class Api::V1::BlogpostsController < ApplicationController
	def index
		blogposts = Blogpost.all
		render json: blogposts
	end

	def new
		blogpost = Blogpost.new
		render json: docter
	end

	def show
		blogpost = Blogpost.find(params[:id])
		render json: blogpost
	end

	def create
		# blogpost = Blogpost.find(params[:user_id])
		# blogpost.user = current.user
		blogpost = Blogpost.new(blogpost_params)
		# blogpost.user_id = current_user.id
		if blogpost.save
			render json: blogpost
		else
			render error: {error: "unable to blogpost."}
		end
	end

	def update
		blogpost = Blogpost.find(params[:id])
		if blogpost
		blogpost.update(blogpost_params)
		render json: {message: "blogpost successfully updated."}
	    else
		render error: {error: "unable to blogpost."}
	    end
	end

	def destroy
		blogpost = Blogpost.find(params[:id])
		if blogpost
		blogpost.destroy
		render json: {message: "blogpost successfully updated."}
	    else
		render error: {error: "unable to blogpost."}
	    end
	end

	private
	def blogpost_params
		params.require(:blogpost).permit(:name, :description, :user_id)
	end
end

class Api::V1::UsersController < ApplicationController
	def index
	   users = User.all
	   render json: users	  
	end

	def new
		user = User.new
		render json: user
	end

	def show
		user = User.find(params[:id])
		render json: user
	end

	def create
		user = User.new(user_params)
		if user.save
			render json: user
		else
			render error: {error: "unable to user."}
		end
	end

	def update
		user = User.find(params[:id])
		if user
		user.update(user_params)
		render json: {message: "user successfully updated."}
	    else
		render error: {error: "unable to user."}
	    end
	end

	def destroy
		user = User.find(params[:id])
		if user
		user.destroy
		render json: {message: "user successfully updated."}
	    else
		render error: {error: "unable to user."}
	    end
	end

	private
	def user_params
		params.require(:user).permit(:uid, :provider, :email, :tokens, :role, :password, :first_name, :last_name, :username)
	end
end

class UsersController < ApplicationController
	before_action :authenticate_user!

	# show 所有服務
	def show
	  @user = current_user
	end

	def my_acount
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)

		old_password = params[:user][:old_password]
		new_password = params[:user][:password]
		new_password_confirmation = params[:user][:password_confirmation]

		if old_password.present?
			if @user.valid_password?(old_password)
				if new_password.present? && new_password == new_password_confirmation
					@user.password = new_password
				else
					flash[:alert] = "new_password fail"
				end
			else
				flash[:alert] = "old_password fail"
			end
		end

		if @user.save
			flash[:notice] = "Successfully edited"
			redirect_to my_acount_user_path(@user)
		else
			render :my_acount
		end
	end

	private

	def user_params
		params.require(:user).permit(
				:first_name, :last_name, :cell_phone_number, :address1, :address2, :city, :is_news_letter
		)
	end
end

class OrdersController < ApplicationController

	before_action :authenticate_user!
	before_action :find_order, only: [:show, :destroy]

	respond_to :html
	respond_to :json, only: [:index, :show]

	def index
		@orders = Order.all
		respond_with @orders
	end

	def show
		respond_with @order
	end

	def destroy
		@order.destroy
		redirect_to root_path
	end

	def import
    begin
    		if (file = params[:file]).nil?
    			flash[:error] = "Error: You must select a file."
    		else
    			@order = current_user.order.create!
    			@order.import(file)
    			flash[:success] = "File successuly imported!"
	    	end
	    	redirect_to root_path
    	rescue
   			flash[:error] = "Error: The selected file cannot be imported."
    		@order.destroy
    		redirect_to root_path
    end
	end


	private
		def find_order
			begin
				@order = Order.find(params[:id])
			rescue
				flash[:error] = "Error: The Order with id #{params[:id]} does not exists."
				redirect_to root_path
			end
		end

		# Strong params
		def post_params
			params.require(:order).permit(:price, :filename, :user_id)
		end
end

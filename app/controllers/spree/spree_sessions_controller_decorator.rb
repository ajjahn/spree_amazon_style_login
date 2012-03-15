module Spree
	UserSessionsController.class_eval do
		
		alias :login :create
		
		def create
			if params[:has_account] == "true"
				login
			else
				@order = current_order(true)		
				fire_event("spree.user.signup", :order => @order)
				@order.state = 'address'
				if @order.update_attributes(params[:user].slice :email)
				  redirect_to checkout_path
				else
				  @user = Spree::User.new
				  render 'spree/checkout/registration'
				end
			end

	  end
	end
end
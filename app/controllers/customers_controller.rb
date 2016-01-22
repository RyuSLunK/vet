class CustomersController < ApplicationController
	def search
		if search_params
			@phone = params[:phone]
			@email = params[:email]
			@customer = Customer.where(phone: @phone,email: @email).take
			if @customer.id
				redirect_to customer_path(@customer)
			else
				redirect_to customers_path
			end
		else
			redirect_to customers_path
		end		
	end
	def show
		@phone = params[:phone]
		@email = params[:email]
		@customer = Customer.where(phone: @phone,email: @email).take
		@appointment = Appointment.where(customer_id: @customer.id).take
		@pet = Pet.find(@appointment.pet_id)
		@doctor = Doctor.find(@appointment.doctor_id)
		if @customer.id and @appointment.id and @pet.id
		
		else
			redirect_to customers_path
		end

	end
	private
    def search_params
      params.require(:phone,:email)
    end
	
end

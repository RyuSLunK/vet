class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end
 
  def show
    @appointment = Appointment.find(params[:id])
  end
 
  def new
    @appointment = Appointment.new
	@pet = Pet.new
	@customer = Customer.new
	#@appointment.pet = @pet
	#@appointment.customer = @customer
  end
 
  def edit
    @appointment = Appointment.find(params[:id])
  end
 
  def create
    @appointment = Appointment.new(appointment_params)
	@appointment.doctor_id = params[:doctor_id]
    if @appointment.save && @appointment.valid?
	  @pet = @appointment.build_pet(appointment_id: @appointment.id)
	  @pet.name = params[:pet_name]
	  @customer = @appointment.build_customer
	  @customer.name = params[:customer_name]
	  @customer.phone = params[:customer_phone]
	  @customer.email = params[:customer_email]
	  if @pet.save and @customer.save and @pet.valid? and @customer.valid? 
		@appointment.pet_id = @pet.id
		@appointment.customer_id = @customer.id
		
		if @appointment.save! 
			redirect_to appointments_path
		else
		@appointment.destroy
		@pet.destroy
		@customer.destroy
		render 'new'
		end
	  else
		unless @customer.valid?
			@appointment.errors.add(:customer_name, ", phone, and e-mail must be entered")
		end
		unless @pet.valid?
			@appointment.errors.add(:pet_name, "was not entered " + params[:pet_name])
		end
		@appointment.destroy
		render 'new'
	  end
    else
      render 'new'
    end
  end
 
  def update
    @appointment = Appointment.find(params[:id])
 
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render 'edit'
    end
  end
 
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
 
    redirect_to appointments_path
  end
 
  private
    def appointment_params
      params.require(:appointment).permit(:date_of_visit,:pet_name,:customer_name,:customer_phone,:customer_email,:doctor,:doctor_id,:pet_id,:customer_id,:requires_reminder,:reason_for_visit)
	  
	end

end

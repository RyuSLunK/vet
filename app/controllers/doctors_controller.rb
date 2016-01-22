class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end
 
  def show
    @doctor = Doctor.find(params[:id])
	@appointments = Appointment.where(doctor_id: @doctor.id)
  end
 
  def new
    @doctor = Doctor.new
  end
 
  def edit
    @doctor = Doctor.find(params[:id])
  end
 
  def create
    @doctor = Doctor.new(doctor_params)
 
    if @doctor.save
      redirect_to doctors_path
    else
      render 'new'
    end
  end
 
  def update
    @doctor = Doctor.find(params[:id])
 
    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render 'edit'
    end
  end
 
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
 
    redirect_to doctors_path
  end
 
  private
    def doctor_params
      params.require(:doctor).permit(:name, :address, :city, :state, :zip, :school, :years_in_practice)
    end
end

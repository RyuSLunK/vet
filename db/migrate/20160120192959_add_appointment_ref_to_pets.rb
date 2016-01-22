class AddAppointmentRefToPets < ActiveRecord::Migration
  def change
    add_reference :pets, :appointment, index: true
  end
end

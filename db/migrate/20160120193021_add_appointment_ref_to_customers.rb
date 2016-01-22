class AddAppointmentRefToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :appointment, index: true
  end
end

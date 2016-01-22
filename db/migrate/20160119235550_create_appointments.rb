class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date_of_visit
      t.references :pet, index: true
      t.references :customer, index: true
      t.boolean :requires_reminder
      t.text :reason_for_visit

      t.timestamps
    end
  end
end

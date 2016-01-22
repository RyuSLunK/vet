class Appointment < ActiveRecord::Base
  
  belongs_to :doctor
  has_one :pet
  has_one :customer
  validate :date_of_visit, presence: true, allow_nil: false, on: :create
  validate :doctor_id, presence: true, allow_nil: false
  validate :date_of_visit_cannot_be_in_the_past
  
  
  def date_of_visit_cannot_be_in_the_past
    unless date_of_visit.present? && date_of_visit >= Date.today
		errors.add(:date_of_visit, "can't be in the past")
	end
	unless doctor_id.present?
		errors.add(:doctor_id, "needs to be selected.")
	end
	if reason_for_visit == ""
		errors.add(:reason_for_visit,"was not provided.")
	end
  end
 end

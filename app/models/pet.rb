class Pet < ActiveRecord::Base
	belongs_to :appointment
	validate :new_name_validation, on: :create
	validate :update_pet_info, on: :update
	def new_name_validation
		if name == ""
			errors.add(:pet_name,"was not provided.")
		end
	end
	def update_pet_info
		unless breed.present? && age.present? && weight.present? && type.present?
			errors.add(:breed, ", age, weight, and type must all be entered.")
		end
		unless date_of_last_visit.present?
			errors.add(:date_of_last_visit, "should be provided.")
		end
	end
end

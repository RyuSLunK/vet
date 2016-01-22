class Customer < ActiveRecord::Base
	belongs_to :appointment
	validate :check_all
	def check_all
		unless name != "" and (phone.length == 10 and phone.to_i != 0) and email != ""
			errors.add(:name, "or other fields are missing.")
		end
	end
end

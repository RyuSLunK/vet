class Doctor < ActiveRecord::Base
	has_many :appointments
	validates :name, presence: true
	validates :years_in_practice, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
	validates :zip, length: {is: 5}
	
end

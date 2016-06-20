class Report
	
	@phone_number

	@total_local_cellphone
	@total_local_telephone
	@total_distance_cellphone
	@total_distance_telephone
	@total_SMS
	@total_internet_data


	def initialize(customer_phone_number)
		@phone_number = customer_phone_number		

		@total_local_cellphone = 0
		@total_local_telephone = 0
		@total_distance_cellphone = 0
		@total_distance_telephone = 0
		@total_SMS = 0
		@total_internet_data = 0
	end

	def increment_SMS
		@total_SMS += 1 
	end

	def get_total_SMS 
		return @total_SMS
	end



end
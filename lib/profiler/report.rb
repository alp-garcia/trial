class Report
	
	def initialize(customer_phone_number)
		@phone_number = customer_phone_number

		@total_local_mobile_phone 	 = 0
		@total_local_fixed_phone  	 = 0
		@total_distance_mobile_phone = 0
		@total_distance_fixed_phone  = 0
		@total_SMS 							  	 = 0
		@total_internet_data				 = 0
	end

	# SMS messages
	def get_total_SMS 
		return @total_SMS
	end

	def increment_SMS
		@total_SMS += 1 
	end
	

	# local mobile phone
	def get_total_local_mobile_phone
		return @total_local_mobile_phone
	end

	def set_local_mobile_duration(call_duration)
		@total_local_mobile_phone += call_duration
	end

	# local fixed phone
	def get_total_local_fixed_phone
		return @total_local_fixed_phone
	end

	def set_local_fixed_duration(call_duration)
		@total_local_fixed_phone += call_duration
	end


	# distance mobile phone
	def get_total_distance_mobile_phone
		return @total_distance_mobile_phone
	end

	def set_distance_mobile_duration(call_duration)
		@total_distance_mobile_phone += call_duration
	end

	# distance fixed phone
	def get_total_distance_fixed_phone
		return @total_distance_fixed_phone
	end

	def set_distance_fixed_duration(call_duration)
		@total_distance_fixed_phone += call_duration
	end

end
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

	def get_total_local_calls
		return @total_local_mobile_phone + @total_local_fixed_phone
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

	def get_total_distance_calls
		return @total_distance_mobile_phone + @total_distance_fixed_phone
	end


	# internet data used
	def get_total_internet_data
		return @total_internet_data
	end

	def set_total_internet_data(megabytes)
		@total_internet_data = megabytes
	end


	# prints to console the result of report
	def print
		puts " ------------------------------------------------------ "
		puts " Relatório de Consumo:"
		puts "  Número do Telefone: #{@phone_number}"
		puts "  "
		puts "  Total de Ligações Locais: #{Profiler::Processor::convert_minutes_to_duration(get_total_local_calls)}"
		puts "    Total de Ligações Locais para Celular: #{Profiler::Processor::convert_minutes_to_duration(@total_local_mobile_phone)}"
		puts "    Total de Ligações Locais para Fixo: #{Profiler::Processor::convert_minutes_to_duration(@total_local_fixed_phone)}"
		puts "  "
		puts "  Total de Ligações de Longa Distância: #{Profiler::Processor::convert_minutes_to_duration(get_total_distance_calls)}"
		puts "    Total de Ligações de Longa Distância para Celular: #{Profiler::Processor::convert_minutes_to_duration(@total_distance_mobile_phone)}"
		puts "    Total de Ligações de Longa Distância para Fixo: #{Profiler::Processor::convert_minutes_to_duration(@total_distance_fixed_phone)}"
		puts "  "
		puts "  Total de SMS: #{@total_SMS} torpedos"
		puts "  Total de uso da internet: #{@total_internet_data} megabytes"
		puts " ------------------------------------------------------ "

		return true
	end

end
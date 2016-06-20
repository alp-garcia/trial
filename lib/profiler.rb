require "profiler/version"
require "profiler/report"
require 'smarter_csv'

module Profiler
	class Processor

		# Processes the file and generates a report about phone number.
		# file_path (string): the path of file to process the report
		# phone_number (string): the phone number
		def self.process_file (file_path, phone_number)
			report = Report.new(phone_number)
			file_content = Processor::read_file(file_path)

			file_content.each do |row|

				# if it's customer phone registry
				if row[:numacs] === phone_number

					case row[:tpserv]
					when /TIM Torpedo/
						report.increment_SMS

					when /Chamadas Locais/
						if(row[:tpserv] == 'Chamadas Locais para Celulares TIM' || row[:tpserv] == 'Chamadas Locais para Outros Celulares')
							report.set_local_mobile_duration(Processor::convert_duration_to_minutes(row[:duracao]))		
						elsif(row[:tpserv] == 'Chamadas Locais para Outros Telefones Fixos' || row[:tpserv] == 'Chamadas Locais para Telefones Fixos') 
							report.set_local_fixed_duration(Processor::convert_duration_to_minutes(row[:duracao]))		
						end

					when /Chamadas Longa Distância/
						if Processor::get_phone_type(row[:numcham]) == 'mobile'
							report.set_distance_mobile_duration(Processor::convert_duration_to_minutes(row[:duracao]))		
						else 
							report.set_distance_fixed_duration(Processor::convert_duration_to_minutes(row[:duracao]))		
						end		

					end

				elsif row[:tpserv] === "Total de Uso Acesso #{phone_number}"
					report.set_total_internet_data(row[:valor].to_f)

				end
			end

			return report
		end


		# Reads a CSV file and converts to array
		# file_path (string): the path of file to process the report
		def self.read_file(file_path)
			return SmarterCSV.process(file_path, {:col_sep => ';', :key_mapping => {:duração => :duracao}})
		end


		# Converts a duration string value (format: 00m00s) to minutes as float
		# duration (string): value with format 00m00s
		def self.convert_duration_to_minutes(duration)
			minutes = duration[0..1].to_f
			seconds = duration[3..4].to_f

			minutes += seconds / 60
			return minutes
		end


		# Converts minutes value to duration formatted string (00m00s)
		# minutes (float): number of minutes to parse
		def self.convert_minutes_to_duration(minutes)
			seconds = format('%02d', (minutes.modulo(1)*60).round())
			minutes = format('%02d', minutes.round())

			return "#{minutes}m#{seconds}s"
		end


		# Gets the phone type by phone number type
		def self.get_phone_type(phone_number)
			phone_number_type = phone_number[4]

			if(phone_number_type == "9" || phone_number_type == "8") 
				return "mobile"
			end 

			return "fixed"
		end

	end
end

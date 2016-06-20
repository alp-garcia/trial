require "profiler/version"
require "profiler/report"

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
					end
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

	end
end

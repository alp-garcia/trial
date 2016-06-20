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

			return report
		end

		# Reads a CSV file and converts to array
		# file_path (string): the path of file to process the report
		def self.read_file(file_path)
			return SmarterCSV.process(file_path, {:col_sep => ';', :key_mapping => {:duração => :duracao}})
		end

	end
end

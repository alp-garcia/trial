require 'spec_helper'

describe Profiler do
  
  # validate gem version
  it 'has a version number' do
    expect(Profiler::VERSION).not_to be nil
  end

  let(:file_path) { file_path = '/Users/possebom/Desktop/sample.csv' }

  let(:file_rows) { file_rows = Profiler::Processor::read_file(file_path) }
  

  context "#process_file" do
  	
  	let(:report) { report = Profiler::Processor::process_file(file_path, '') }

  	it "validates is a valid report" do
  		expect(report).to_not be_nil
  	end

  end


  context "#open_file" do 
  	
  	it "validates is a valid file" do
  		expect(file_rows).to_not be_nil
  	end

  	it "validates is not a empty file" do
  		expect(file_rows.size).to be > 0
  	end

  end


  context "validates converts functions" do 
  	
  	it "can converts duration to minutes" do
  		duration = "01m06s"
  		minutes = Profiler::Processor::convert_duration_to_minutes(duration)

  		expect(minutes).to_not be_nil
  		expect(minutes).to equal(1.1)
  	end


  	it "can converts minutes to duration" do
  		minutes = 5.3
			duration = Profiler::Processor::convert_minutes_to_duration(minutes)

			expect(duration).to_not be_nil
			expect(duration).to eq("05m18s")
  	end

  end


  context "validates phone type" do

  	it "is a mobile phone where first digit is 9" do
  		phone_type = Profiler::Processor::get_phone_type('xxx-9xxx-xxxx')

  		expect(phone_type).to eq("mobile")
  	end

  	it "is a mobile phone where first digit is 8" do
  		phone_type = Profiler::Processor::get_phone_type('xxx-8xxx-xxxx')

  		expect(phone_type).to eq("mobile")
  	end

  	it "is a fixed phone" do
  		phone_type = Profiler::Processor::get_phone_type('xxx-3xxx-xxxx')

  		expect(phone_type).to eq("fixed")
  	end

  end

end

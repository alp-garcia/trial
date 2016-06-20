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

  		expect(minutes).to equal(1.1)
  	end

  end

end

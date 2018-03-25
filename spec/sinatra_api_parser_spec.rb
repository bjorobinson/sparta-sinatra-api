require 'spec_helper'
describe SinatraAPIParser do
  context "Validation Service" do
    before(:all) do
      @test_call = SinatraAPIParser.new.validation_service
    end

    it "should return status as 'OK'" do
      expect(@test_call.get_status).to eq 'OK'
    end

    it "should return number of results as an Integer" do
      expect(@test_call.get_num_results).to be_instance_of Integer
    end
  end

  context "Results Service" do
    before(:all) do
      @test_call = SinatraAPIParser.new.results_service
    end

    it "..." do
      # puts @test_call.get_response[0]['section']
      # puts @test_call.get_sections
    end

    it "should return a list of all article titles" do

    end

    it "should, using article title, return its index in results" do

    end

    it "should, using an article index, return the articles section" do

    end

    it "should, using an article index, return the articles abstract" do

    end

    it "should, using an article index, return the articles shortenned URL" do

    end

    it "should, using an article index, return the articles byline" do
      
    end
  end
end

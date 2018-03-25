require 'spec_helper'
describe SinatraAPIParser do
  context "Validation Services" do
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
end

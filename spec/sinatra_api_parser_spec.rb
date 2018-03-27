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

    it "should return when it was last updated as a String" do
      expect(@test_call.get_last_updated).to be_instance_of String
    end
  end

  context "Results Service" do
    before(:all) do
      @test_call = SinatraAPIParser.new.results_service
    end

    it "should get all articles as a response" do
      expect(@test_call.get_response).to be_instance_of Array
    end

    it "should return an article for a given index" do
      expect(@test_call.get_article(0)).to be_instance_of Hash
    end

    it "should return a given component of an article for a given index" do
      expect(@test_call.get_article_component(0,'section')).to be_instance_of String
    end

  end
end

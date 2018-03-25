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

    it "should return a list of all article titles" do
      expect(@test_call.get_titles).to be_instance_of Array
    end

    it "should return the maximum index of results" do
      expect(@test_call.get_max_index).to be_instance_of Integer
    end

    it "should check if a number provided as an arguement is within the valid bounds of the index range" do
      expect(@test_call.is_valid_index(0)).to be true
      expect(@test_call.is_valid_index(@test_call.get_max_index)).to be true
      expect(@test_call.is_valid_index(-1)).to be false
      expect(@test_call.is_valid_index(@test_call.get_max_index+1)).to be false
    end

    it "should, using an index in results, return articles title" do
      expect(@test_call.get_title(0)).to be_instance_of String
    end

    it "should, using an article index, return the articles section" do
      expect(@test_call.get_section(0)).to be_instance_of String
    end

    it "should, using an article index, return the articles abstract" do
      expect(@test_call.get_abstract(0)).to be_instance_of String
    end

    it "should, using an article index, return the articles shortenned URL" do
      expect(@test_call.get_URL(0)).to be_instance_of String
    end

    it "should, using an article index, return the articles byline" do
      expect(@test_call.get_byline(0)).to be_instance_of String
    end

    it "should, using an index number, return an array with the articles title, section, abstract, url and byline" do
      expect(@test_call.get_article(0)).to be_instance_of Array
    end

    it "should return a single 2D Array of article name and its external link" do
      expect(@test_call.get_single_article_for_index(0)).to be_instance_of Array
    end

    it "should return a 2D Array of article names and their external links to be displayed on the index page" do
      expect(@test_call.get_articles_for_index).to be_instance_of Array
    end
  end
end

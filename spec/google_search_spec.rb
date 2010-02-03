require File.dirname(__FILE__) + '/spec_helper'

describe "Google search" do
  context "Doing a valid query" do
    before :all do
      GoogleSearch.default_options = { :hl => "hr" }
      @result = GoogleSearch.web :q => "Michael Jackson", :start => 10
    end

    it "result should be a hash" do
      @result.should be_a_kind_of Hash
    end

    it "should be have status OK" do
      @result["responseStatus"].should == 200
    end

    it "should have results" do
      @result["responseData"]["results"].should_not be_empty
    end
  end

  context "Doing an invalid query" do
    before :all do
      @query = lambda {  GoogleSearch.web :this_wont_work => true }
    end

    it "should raise an exception" do
      @query.should raise_error GoogleSearchError
    end
  end
end

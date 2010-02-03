require File.dirname(__FILE__) + '/spec_helper'

describe "Google search" do
  context "Doing a query" do
    require 'google_search'

    before :all do
      GoogleSearch.default_options = { :hl => "hr", :start => 10 }
      @result = GoogleSearch.web :q => "Michael Jackson"
    end

    it do
      @result.should be_a_kind_of Hash
    end

    it "should have expected values" do
      @result.should have_key "responseData"
      @result["responseData"].should have_key "results"
      @result["responseData"]["results"].should_not be_empty
    end
  end
end

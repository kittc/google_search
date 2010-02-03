require File.dirname(__FILE__) + '/spec_helper'

describe "Doing a paginated search" do
  context "Searching 3 pages" do
    before do
      @results = []
      GoogleSearch.with_pages(1..3) do |search|
        @results << search.images(:q => "moon")
      end
    end

    it "page should be called 3 times" do
      @results.size.should == 3
    end

    it "each page results should originate from its page" do
      page = 0

      puts @results.each do 
        |result| 
        page.should == result["responseData"]["cursor"]["currentPageIndex"].to_i
        page += 1
      end
    end
  end

end

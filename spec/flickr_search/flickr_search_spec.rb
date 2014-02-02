require 'spec_helper'

describe FlickrSearch::FlickrSearch do

  let(:api_key) { ENV['FLICKR_API_KEY'] }

  context "Object instantiation" do

    let(:flickr_search) {FlickrSearch::FlickrSearch.new(api_key)}

    it "should load properly}" do
      flickr_search.should be_kind_of(FlickrSearch::FlickrSearch)
    end

    it "should have an api key" do
      flickr_search.api_key.should eql(api_key)
    end

    it "api key shouldn't be nil unless the dev forgot to set the env variable" do
      flickr_search.api_key.should_not eql(nil)
    end

  end

  context "perform search" do

    let(:search_term) { "boulder" }
    let(:flickr_search) {FlickrSearch::FlickrSearch.new(api_key).search(search_term)}

    it "should remember the search term" do
      flickr_search.search_query.should eql(search_term)
    end

    it "should have > 1 search results" do
      flickr_search.num_results.should_not eql(0)
    end

    it "should return a photo's URL" do
      flickr_search.random_photo_url.should_not eql(nil)
    end

    it "should return a photo's description" do
      flickr_search.random_photo_description.should_not eql(nil)
    end

  end

end

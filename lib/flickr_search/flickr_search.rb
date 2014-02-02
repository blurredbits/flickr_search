require 'faraday' #hafta explicitly require it in a gem vs. rails
require 'JSON' #again hafta explicitly require it for the gem/ruby vs. rails

module FlickrSearch
  class FlickrSearch

    def initialize(api_key = nil)
      @api_key = api_key if api_key
    end

    def search(query)
      @search_query = query
      #http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=8488f3aeb049689b2f6aec5ff0859de5&text=denver&format=json&nojsoncallback=1
      @response = conn.get do |req|
        req.url flickr_endpoint, api_key: api_key, method: api_method, text: search_query, format: format, nojsoncallback: 1
      end

      self #otherwise we'd be returning @response which is a Faraday::Response and we wouldn't be able to chain as expected
    end

    def search_query
      @search_query
    end

    def api_key
      @api_key ||= ENV['FLICKR_API_KEY']
    end

    def num_results
      json_response["photos"]["total"].to_i
    end

    def random_photo_url
      photo_url random_photo
    end

    def random_photo_description
      random_photo["title"]
    end

    private

      def random_photo
        @random_photo ||= json_response["photos"]["photo"].sample
      end

      def photo_url(photo_json, photo_size = nil)

        farm = photo_json["farm"]
        server = photo_json["server"]
        id = photo_json["id"]
        secret = photo_json["secret"]
        size = photo_size || "_b"

        "http://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}#{size}.jpg"

      end

      def response
         @response
      end

      def json_response
       @json_response ||= JSON.parse(response.body)
      end

      def api_method
        @api_method ||= %q{flickr.photos.search}
      end

      def format
        @format ||= "json"
      end

      def conn
        @conn ||= Faraday.new(:url => flickr_endpoint) do |f|
          f.request :url_encoded
          f.response :logger
          f.adapter Faraday.default_adapter
        end
      end

      def flickr_endpoint
        @flickr_endpoint ||= %q{http://api.flickr.com/services/rest/}
      end

  end

end

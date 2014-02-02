# FlickrSearch

Allows you to use add public images from Flickr into your application using your own Flickr Developer API credentials.

Extracted from a little Ruby 2.1.0p0 / Rails 4.0.2 app.

## Installation

Add this line to your application's Gemfile:

    gem 'flickr_search'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flickr_search

Then create an environment variable (pick your favorite method or read http://railsapps.github.io/rails-environment-variables.html if you don't have one yet) to make your FLICKR_API_KEY available to the gem.

The easiest/quick-and-dirty to get started is
```
 $export FLICKR_API_KEY='YOUR_OWN_DEVELOPER_KEY'
```

## Rails Usage

# In your controller, instantiate an instance & pass it a search term.
```
  @flickr = FlickrSearch::FlickrSearch.new
  @flickr.search("Boulder, Colorado")

  #or just

  @flickr = FlickrSearch::FlickrSearch.new.search("Boulder, Colorado")

```
# Then use the your instance to populate an img src in your View or something

```
<% if @flickr %>
  <%= @flickr.num_results %> photos found for <%= @flickr.search_query %>. Here's one:
  <br/>
  <%= image_tag @flickr.random_photo_url %>
  <br/>
  <%= @flickr.random_photo_description %>
<% end %>
```

## TODO

# Better gem testing with VCR/Webmock
# More intelligent searching (tags vs. description, AND vs. OR, etc), some image metadata attributes or just METAprogram the parameters @ http://www.flickr.com/services/api/flickr.photos.search.html
# Proper image credits per Flickr's API rules without doing a 2nd api call
# Return the url of a local 404 image if there are any errors or timeouts calling Flickr api
# Refactor

## Contributing

1. Fork it ( http://github.com/velobuff/flickr_search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

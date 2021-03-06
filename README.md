# FlickrSearch

Allows you to use add public images from Flickr into your application using your own Flickr Developer API credentials.

Extracted from a little example Ruby 2.1.0p0 / Rails 4.0.2 app that accompanies my talk about Mining for Gems in your Rails App.

## Installation

Add this line to your application's Gemfile:

    gem 'flickr_search', git: 'git://github.com/velobuff/flickr_search.git'

And then execute:

    $ bundle

Then create an environment variable (pick your favorite method or read http://railsapps.github.io/rails-environment-variables.html if you don't have one yet) to make your FLICKR_API_KEY available to the gem.

The quick-and-dirty way to add an environment variable for testing is:
```
 $export FLICKR_API_KEY='YOUR_OWN_DEVELOPER_KEY'
```

Alternatively, you can send in your api key as an optional parameter when you're new-ing up the FlickrSearch object but this is highly discouraged because you'll inadvertently end up sharing your api key when you push your code to GitHub. Plus saving your config within the app is not http://12factor.net - savvy anyway. And you do want to be savvy, don't you?


## Rails Usage

In your controller, instantiate an instance & pass it a search term.

```
  @flickr = FlickrSearch::FlickrSearch.new
  @flickr.search("Boulder, Colorado")

  #or just

  @flickr = FlickrSearch::FlickrSearch.new.search("Boulder, Colorado")

```

Then use the your instance to populate an img src in your View or something

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

* Better gem testing with VCR/Webmock
* More intelligent searching (tags vs. description, AND vs. OR, etc), some image metadata attributes or just METAprogram the parameters @ http://www.flickr.com/services/api/flickr.photos.search.html
* Proper image credits per Flickr's API rules without doing a 2nd api call
* Return the url of a local 404 image if there are any errors or timeouts calling Flickr api
* Refactor

## Contributing

1. Fork it ( http://github.com/velobuff/flickr_search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

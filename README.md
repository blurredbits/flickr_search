# FlickrSearch

Allows you to use add public images from Flickr into your application using your Flickr Developer API credentials.

## Installation

Add this line to your application's Gemfile:

    gem 'flickr_search'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flickr_search

Then create an environment variable (pick your favorite method or read http://railsapps.github.io/rails-environment-variables.html if you don't have one yet) to make your FLICKR_API_KEY available to the gem.

## Usage

# In your controller, instantiate an object & pass it a search term.
``` @flickr = FlickrSearch.new
    @flickr.search "boulder"
```
# Then use the your instance to populate an img src in your view or something

```
<%= image_tag @flickr.random_image_url %>
<%= @flickr.random_image_description %>

```

## TODO

# Proper image credits per Flickr's API rules
# Return the url of a local 404 image if there are any errors or timeouts calling Flickr api


## Contributing

1. Fork it ( http://github.com/<my-github-username>/flickr_search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

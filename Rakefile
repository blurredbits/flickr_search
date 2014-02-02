require "bundler/gem_tasks"

# make irb easy for use with gem development
# http://simonecarletti.com/blog/2009/09/rake-console/
namespace :velobuff do
  task :console  do
    sh "irb -rubygems -I lib -r flickr_search.rb"
  end
end

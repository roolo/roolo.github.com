# encoding: utf-8
require 'rubygems'
require 'jekyll'
include Jekyll::Filters

def jekyll_site
  jekyll_options = Jekyll.configuration(
    YAML::load(
      File.read('_config.yml')
    )
  )
  jekyll_site = Jekyll::Site.new(jekyll_options)
  jekyll_site.read_posts('')
  jekyll_site
end


import 'tasks/tags.rake'
import 'tasks/url.rake'
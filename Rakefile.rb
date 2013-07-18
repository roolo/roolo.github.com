# encoding: utf-8
require 'rubygems'
require 'jekyll'
include Jekyll::Filters

def jekyll_site
  if @jekyll_site_var.nil?
    jekyll_options = Jekyll.configuration(
      YAML::load(
        File.read('_config.yml')
      )
    )
    @jekyll_site_var = Jekyll::Site.new(jekyll_options)
    @jekyll_site_var.read_posts('')
  end
  
  @jekyll_site_var
end

import 'tasks/tags.rake'
import 'tasks/url.rake'

task default: %w(tags urls)

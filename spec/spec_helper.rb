require 'bundler/setup'
require 'minitest/autorun'
require 'rack/test'
require 'rack/jekyll'
require 'nokogiri'


def app
  Rack::Jekyll.new
end

def try_access url, processed = []
  get url
  assert_equal  last_response.status,
                200,
                url

  document = Nokogiri::HTML last_response.body

  links = document.xpath('//a').map{|node| node['href']}

  unless links.empty?
    links.each do |link|
      try_access link, processed.push(link) unless link =~ /^(http|itpc)/ || processed.include?(link)
    end
  end

end


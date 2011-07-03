# encoding: utf-8
def filyfy string
  conv  = Iconv.new("ASCII//TRANSLIT", "UTF-8")
  conv.iconv(string).gsub(/\W*/, '').downcase
end


desc 'Generate all tags related things'
task :tags_all do
  Rake::Task['tags'].execute
  Rake::Task['tag_cloud'].execute
end

desc 'Generate tags page'
task :tags do
  puts "Generating tags..."
  require 'rubygems'
  require 'jekyll'
  include Jekyll::Filters
  
  options = Jekyll.configuration({})
  site = Jekyll::Site.new(options)
  site.read_posts('')
  site.categories.sort.each do |category, posts|
    html = ''
    html << <<-HTML
---
layout: default
title: Postings tagged "#{category}"
---
    <h2 id="#{category}">Postings tagged "#{category}"</h2>
HTML
    html << '<ul class="posts">'
    posts.each do |post|
      post_data = post.to_liquid
      html << <<-HTML
        <li>#{post_data['title']}</li>
      HTML
    end
    html << '</ul>'
    
    File.open("tag/#{filyfy(category)}.html", 'w+') do |file|
      file.puts html
    end
  end
  puts 'Done.'
end

desc 'Generate tag cloud page'
task :tag_cloud do
  puts 'Generating tag cloud...'
  require 'rubygems'
  require 'jekyll'
  require 'iconv'
  include Jekyll::Filters

  options = Jekyll.configuration({})
  site = Jekyll::Site.new(options)
  site.read_posts('')


  html =<<-HTML
---
layout: default
title: Tags
type: A tag cloud
---

<h2>Seznam tagů</h2>

<p>Click on a tagto see the relevant posts.</p>
HTML

  site.categories.sort.each do |category, posts|
    next if category == ".net"
    html << <<-HTML
    HTML
    
    s = posts.count
    font_size = 12 + (s*1.5);
    html << "<a href=\"/tag/#{filyfy(category)}.html\" title=\"Entries tagged #{category}\" style=\"font-size: #{font_size}px; line-height:#{font_size}px\">#{category}</a> "
  end




  File.open('tags.html', 'w+') do |file|
    file.puts html
  end

  puts 'Done.'

end
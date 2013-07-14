# encoding: utf-8
def filyfy string
  conv  = Iconv.new("ASCII//TRANSLIT", "UTF-8")
  conv.iconv(string).gsub(/\W*/, '').downcase
end

desc 'Generate all tags related things'
task tags: %w(tags:pages tags:cloud tags:sitemap)

namespace :tags do
  desc 'Generate tags page'
  task :pages do
    puts "Generating tags..."
    jekyll_site.categories.sort.reverse.each do |category, posts|
      html = ''
      html << <<-HTML
---
layout: default
title: Posty s tagem "#{category}"
---
    <h2 id="#{category}">Posty otagovány "#{category}"</h2>
    <table class="table table-striped">
      <tr>
        <th>Datum</th>
        <th>Název</th>
      </tr>
HTML
      posts.sort.reverse.each do |post|
        post_data = post.to_liquid
        post_date = post_data['date'].strftime("%d.%m.%Y")
        html << <<-HTML
          <tr>
            <td class="post_date">#{post_date}</td>
            <td class="post_title"><a href="#{post_data['url']}">#{post_data['title']}</a></td>
          </tr>
        HTML
      end
      html << <<-HTML
        </table>
        <a href="/tags.html">Všechny tagy</a>
  HTML

      File.open("tag/#{filyfy(category)}.html", 'w+') do |file|
        file.puts html
      end
    end
    puts 'Done.'
  end

  desc 'Generate tag cloud page'
  task :cloud do
    puts 'Generating tag cloud...'
    require 'iconv'

    html =<<-HTML
---
layout: default
title: Tags
type: Tag cloud
---

<h2>Seznam tagů</h2>

HTML

    jekyll_site.categories.sort.each do |category, posts|
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
  
  desc 'Generates sitemap part for tags'
  task :sitemap do
    puts 'Generating sitemap...'
    site = jekyll_site
    
    xml = ["
  <url>
    <loc>{{site.url}}/tags.html</loc>
    <lastmod>#{Jekyll::Filters::date_to_xmlschema site.posts.sort.reverse.first.date }</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.90</priority>
  </url>
    "]
    
    xml << site.categories.sort.map do |category, posts|
      <<-XML
      
  <url>
    <loc>{{site.url}}/tag/#{filyfy category}.html</loc>
    <lastmod>#{Jekyll::Filters::date_to_xmlschema posts.sort.reverse.first.date }</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.80</priority>
  </url>
      XML
    end
    
    File.open('_includes/sitemap-tags.xml', 'w+') do |file|
      file.puts xml.join
    end
    
    
  end
  
end

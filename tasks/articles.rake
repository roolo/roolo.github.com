namespace :generate do
  desc 'Generates all articles stuff'
  task articles: %w(articles:json)
  namespace :articles do
    desc "Generates json of all articles"
    task :json do
      require 'json'

      articles = {data: []}
      jekyll_site.posts.each do |p|
        #raise p.data.inspect
        articles[:data] << {
          identifier: p.data['title'],
          title: p.data['title'],
          content_blob: p.content + (p.data['excerpt'] || '')
        }
      end

      File.open("articles.json", 'w+') do |file|
        file.puts articles.to_json
      end
    end
  end
end

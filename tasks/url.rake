
namespace :urls do
  desc 'Generates redirection pages for those which has it'
  task :redirects_old_to_new do
    puts 'Processing posts'
    site = jekyll_site

    site.posts.each do |post|
      puts 'Processing ' + post.data['title']
      generate_aliases(post.url, post.data['alias'], site)
    end
  end
end

def generate_aliases(destination_path, aliases, site)
  alias_paths ||= Array.new
  alias_paths << aliases
  alias_paths.compact!

  puts '- no aliases' if aliases.nil? || aliases.empty?

  alias_paths.flatten.each do |alias_path|
    puts '- processing alias ' + alias_path

    # If alias_path has an extension, we'll write the alias file
    # directly to that path.  Otherwise, we'll assume that the
    # alias_path is a directory, in which case we'll generate an
    # index.html file.
    alias_dir = File.extname(alias_path).empty? ? alias_path : File.dirname(alias_path)
    alias_file = File.extname(alias_path).empty? ? "index.html" : File.basename(alias_path)

    fs_path_to_dir = File.expand_path '../'+alias_dir, File.dirname(__FILE__)
    alias_index_path = File.join(alias_dir, alias_file)

    FileUtils.mkdir_p(fs_path_to_dir)

    File.open(File.join(fs_path_to_dir, alias_file), 'w') do |file|
      file.write(alias_template(destination_path))
    end

    (alias_index_path.split('/').size + 1).times do |sections|
      site.static_files << Jekyll::AliasFile.new(site, site.dest, alias_index_path.split('/')[0, sections].join('/'), nil)
    end
  end
end

def destination(dest)
  File.join(dest, @dir)
end

def alias_template(destination_path)
  <<-EOF
  <!DOCTYPE html>
  <html>
  <head>
  <link rel="canonical" href="#{destination_path}"/>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="refresh" content="0;url=#{destination_path}" />
  </head>
  </html>
  EOF
end

require 'jekyll/static_file'

module Jekyll
  class AliasFile < StaticFile
    require 'set'

    def destination(dest)
      File.join(dest, @dir)
    end

    def modified?
      return false
    end

    def write(dest)
      return true
    end
  end
end

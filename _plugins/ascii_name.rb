module Jekyll
  class AsciiNameTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      conv  = Iconv.new("ASCII//TRANSLIT", "UTF-8")
      conv.iconv(context['category']).gsub(/\W*/, '').downcase
    end
  end
end

Liquid::Template.register_tag('ascii_name', Jekyll::AsciiNameTag)
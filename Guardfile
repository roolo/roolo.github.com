# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :minitest, cli: '--pride' do
  # with Minitest::Spec
  watch(%r{^spec/(.*)_spec\.rb})
  watch(%r{^_posts/.*})         { |m| "spec/*_spec.rb" }
  watch(%r{^spec/spec_helper\.rb}) { 'spec' }
end

guard 'jekyll' do
  watch /_.*/
  ignore /_site/
end

require 'spec_helper'

describe 'Urls on this blog' do
  include Rack::Test::Methods

  it 'should be accessible localy' do
    try_access '/'
  end
end


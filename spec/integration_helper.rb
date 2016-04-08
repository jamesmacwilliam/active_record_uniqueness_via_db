require 'spec_helper'
require 'support/ar_setup'
require 'support/foo'

RSpec.configure do |c|
  c.before { Foo.delete_all }
end


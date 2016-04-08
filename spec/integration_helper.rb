require 'spec_helper'
require 'support/foo'

if ENV["TEST_ENV"] == "travis"
  require 'support/ar_setup'

  RSpec.configure do |c|
    c.before { Foo.delete_all }
  end
else
  RSpec.configure do |c|
    c.filter_run_excluding :integration => true
  end
end

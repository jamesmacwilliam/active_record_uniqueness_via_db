require 'rails/generators/base'

module ActiveRecordUniquenessViaDb
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates an ActiveRecordUniqunessViaDb initializer."

      def copy_initializer
        template "active_record_uniqueness_via_db.rb", "config/initializers/active_record_uniqueness_via_db.rb"
      end
    end
  end
end
module ActiveRecord
  module Validations
    class UniquenessValidator < ActiveModel::EachValidator

      alias :old_validate_each :validate_each
      alias :old_initialize    :initialize

      def initialize(options)
        if options[:via].present? && !options[:via] == :db
          raise ArgumentError, "the :via option only accepts :db"
        end
        old_initialize(options)
      end

      def validate_each(record, attribute, value)
        error_options =
          options.
          merge(:value => value).
          except(:case_sensitive, :scope, :conditions)

        ActiveRecordUniquenessViaDb::Builder.call(
          record,
          attribute,
          !options[:via],
          error_options,
        ) { old_validate_each(record, attribute, value) }
      end
    end
  end
end

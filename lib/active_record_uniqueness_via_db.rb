require 'active_record_uniqueness_via_db/version'
require 'active_record_uniqueness_via_db/builder'
require 'active_record_uniqueness_via_db/validator'
require 'active_record_uniqueness_via_db/adapter'
require 'active_record/validations/uniqueness_validator'

module ActiveRecordUniquenessViaDb
  ATTRS_IVAR = :attrs_to_rescue_uniqueness_db
end

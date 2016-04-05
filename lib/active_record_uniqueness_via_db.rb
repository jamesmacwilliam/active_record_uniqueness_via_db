require 'active_record'
require 'active_record_uniqueness_via_db/version'
require 'active_record_uniqueness_via_db/builder'
require 'active_record_uniqueness_via_db/validator'
require 'active_record_uniqueness_via_db/adapters'
require 'active_record_uniqueness_via_db/adapter'

module ActiveRecordUniquenessViaDb
  ATTRS_IVAR = :attrs_to_rescue_uniqueness_db
end

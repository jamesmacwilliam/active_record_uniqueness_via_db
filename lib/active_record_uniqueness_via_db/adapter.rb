require 'active_record_uniqueness_via_db/adapters/mysql2'
require 'active_support/inflector'

class ActiveRecordUniquenessViaDb::Adapter
  def self.for(ar_adapter)
    "ActiveRecordUniquenessViaDb::Adapters::#{ar_adapter.classify}".constantize.new
  end
end

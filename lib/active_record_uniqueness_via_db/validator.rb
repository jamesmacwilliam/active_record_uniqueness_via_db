class ActiveRecordUniquenessViaDb::Validator
  attr_accessor :adapter, :record, :exception, :attrs_to_rescue

  def initialize(adapter, record, exception)
    @adapter         = adapter
    @record          = record
    @exception       = exception
    @attrs_to_rescue = record.
      instance_variable_get("@#{ActiveRecordUniquenessViaDb::ATTRS_IVAR}") || {}
  end

  def call
    if attribute_with_error
      record.errors.add(attribute_with_error.first, :taken, attribute_with_error.last)
    else
      raise exception
    end
  end

  def self.validate(adapter, record, exception)
    new(adapter,record, exception).call
  end

  private

  def attribute_with_error
    @attr_with_error ||=
      attrs_to_rescue.
      find { |attr, _| adapter.error_matches_attr(attr, exception.message) }
  end
end

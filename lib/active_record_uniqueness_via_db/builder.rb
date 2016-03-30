class ActiveRecordUniquenessViaDb::Builder
  attr_accessor :block, :record, :attr_name, :always_block, :attrs_to_rescue,
    :error_options

  def initialize(record, attr_name, always_block, error_options, &block)
    @record          = record
    @block           = block
    @attr_name       = attr_name
    @always_block    = always_block
    @error_options   = error_options
    @attrs_to_rescue = record.
      instance_variable_get("@#{ActiveRecordUniquenessViaDb::ATTRS_IVAR}") || {}
    @attrs_to_rescue.delete(attr_name)
    #binding.pry
  end

  def call
    via_db? ? @attrs_to_rescue[attr_name] = error_options : block.call
    specify_attributes_to_rescue_db_error
  end

  def self.call(record, attr_name, always_block, error_options, &block)
    new(record, attr_name, always_block, error_options, &block).call
  end

  private

  def specify_attributes_to_rescue_db_error
    record.instance_variable_set(
      "@#{ActiveRecordUniquenessViaDb::ATTRS_IVAR}",
      attrs_to_rescue
    )
  end

  def via_db?
    record.changed? && !always_block
  end
end

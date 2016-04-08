module ActiveRecord
  class Base

    cattr_accessor ActiveRecordUniquenessViaDb::ATTRS_IVAR

    alias :original_create_or_update :create_or_update
    alias :original_save!            :save!

    def create_or_update
      original_create_or_update
    rescue ActiveRecord::RecordNotUnique => e
      uniqueness_via_db_validator(e)
      @original_validation_error =
        ActiveRecord::RecordNotUnique.new(self.errors.full_messages.first)
      false
    end

    def save!(*)
      original_save!
    rescue ActiveRecord::RecordNotSaved => e
      raise(@original_validation_error) if @original_validation_error
      raise e
    end

    private

    def uniqueness_via_db_validator(exception)
      ActiveRecordUniquenessViaDb::Validator.validate(
        ActiveRecordUniquenessViaDb::Adapter.for(self.class.connection_config[:adapter]),
        self,
        exception
      )
    end
  end
end

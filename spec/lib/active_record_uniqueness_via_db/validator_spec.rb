require 'spec_helper'

RSpec.describe ActiveRecordUniquenessViaDb::Validator do
  let(:adapter) { ActiveRecordUniquenessViaDb::Adapter.for("mysql2") }
  let(:errors) { double(:add => true) }
  let(:record) { double(:errors => errors) }
  let(:err) { ActiveRecord::RecordNotUnique.new("Mysql2:Error Duplicate entry for key 'some_index_for_key_valid'") }
  let(:validator) { described_class.new(adapter, record, err) }
  subject { ->{ validator.call } }

  context "when valid key" do
    before { record.instance_variable_set(:@attrs_to_rescue_uniqueness_db, { :valid => {} }) }

    it { is_expected.not_to raise_error }
  end

  context "when key is not part of uniqueness validation" do
    it { is_expected.to raise_error }
  end

  it "sets error on record" do
    record.instance_variable_set(:@attrs_to_rescue_uniqueness_db, { :valid => {} })
    expect(errors).to receive(:add).with(:valid, :taken, {})
    validator.call
  end
end

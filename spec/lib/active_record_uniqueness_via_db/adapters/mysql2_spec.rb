require 'spec_helper'

RSpec.describe ActiveRecordUniquenessViaDb::Adapters::Mysql2 do
  describe "#error_matches_attr" do
    subject { described_class.new.error_matches_attr(attr, msg) }
    let(:msg) { "Mysql2:Error Duplicate entry for key 'some_index_for_key_valid'" }

    context "when key matches uniqueness index" do
      let(:attr) { :valid }

      it { is_expected.to be_truthy }
    end

    context "when key does not match uniqueness index" do
      let(:attr) { :err }

      it { is_expected.to be_falsey }
    end
  end
end

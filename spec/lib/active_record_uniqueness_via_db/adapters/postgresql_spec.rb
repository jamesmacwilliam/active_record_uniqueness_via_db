require 'spec_helper'

RSpec.describe ActiveRecordUniquenessViaDb::Adapters::Postgresql do
  describe "#error_matches_attr" do
    subject { described_class.new.error_matches_attr(attr, msg) }
    let(:msg) { "PG::UniqueViolation: ERROR:  duplicate key value violates unique constraint \"index_foos_on_company_id\"\nDETAIL:  Key (company_id)=(foo) already exists.\n: INSERT INTO \"foos\" (\"company_id\") VALUES ($1) RETURNING \"id\"" }

    context "when key matches uniqueness index" do
      let(:attr) { :company_id }

      it { is_expected.to be_truthy }
    end

    context "when key does not match uniqueness index" do
      let(:attr) { :err }

      it { is_expected.to be_falsey }
    end
  end
end

require 'spec_helper'

RSpec.describe ActiveRecord::Validations::UniquenessValidator do
  describe "#initialize" do
    subject { ->{ described_class.new(opts) } }

    context "with valid options" do
      let(:opts) { { attributes: [:test], via: :db } }

      it { is_expected.not_to raise_error }
    end

    context "with invalid options" do
      let(:opts) { { attributes: [:test], via: :invalid } }

      it { is_expected.to raise_error(ArgumentError, "the :via option only accepts :db")  }
    end
  end

  describe "#validate_each" do
    let(:record) { double(changed?: true) }

    it "sets up attributes to skip db error for" do
      described_class.new(attributes: [:test], via: :db).validate_each(record, :foo, "bar")
      expect(record.instance_variable_get(:@attrs_to_rescue_uniqueness_db)).to eq({:foo => {:via=>:db, :value=>"bar"}})
    end

    it "does not set up attributes if via db is not specified" do
      expect_any_instance_of(described_class).to receive(:old_validate_each)
      described_class.new(attributes: [:test]).validate_each(record, :foo, "bar")
    end
  end
end

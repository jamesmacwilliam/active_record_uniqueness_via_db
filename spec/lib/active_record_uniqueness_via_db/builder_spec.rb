require 'spec_helper'

RSpec.describe ActiveRecordUniquenessViaDb::Builder do
  let(:builder) { described_class.new(record, :foo, always_block, {}) { test.call } }
  let(:record) { double(changed?: is_changed) }
  let(:is_changed) { true }
  let(:always_block) { false }
  let(:test) { double(call: true) }

  describe "block called" do
    subject { test }
    after { builder.call }

    context "defaulting to base unique validation" do
      before { allow(builder).to receive(:via_db?) { false } }

      it { is_expected.to receive(:call) }
    end

    context "defaulting to base unique validation" do
      before { allow(builder).to receive(:via_db?) { true } }

      it { is_expected.not_to receive(:call) }
    end
  end

  describe "attrs_to_rescue setup" do
    subject { record.instance_variable_get(:@attrs_to_rescue_uniqueness_db).keys }
    before { builder.call }

    context "record has changed" do
      context "via: :db is set" do
        it { is_expected.to include :foo }
      end

      context "via: :db is not set" do
        let(:always_block) { true }

        it { is_expected.not_to include :foo }
      end
    end

    context "record has not changed" do
      let(:is_changed) { false }

      context "via: :db is set" do
        it { is_expected.not_to include :foo }
      end

      context "via: :db is not set" do
        let(:always_block) { true }

        it { is_expected.not_to include :foo }
      end
    end


  end
end

require 'spec_helper'

RSpec.describe ActiveRecordUniquenessViaDb::Adapter do
  describe ".for" do
    it "returns instance of the appropriate adapter" do
      expect(described_class.for("mysql2")).to be_an_instance_of(ActiveRecordUniquenessViaDb::Adapters::Mysql2)
    end
  end
end

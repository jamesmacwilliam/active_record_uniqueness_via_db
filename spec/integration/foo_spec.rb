require 'integration_helper'

describe Foo, :integration => true do
  let(:model) { Foo.new(bar: "test") }
  let(:connection) { ActiveRecord::Base.connection }
  before { allow(model).to receive(:connection) { connection } }

  it "does not perform a select prior to the insert on create" do
    expect_any_instance_of(ActiveRecord::Validations::UniquenessValidator).not_to receive(:find_finder_class_for)
    model.save
  end

  it "falls back to the select on valid?" do
    expect_any_instance_of(ActiveRecord::Validations::UniquenessValidator).not_to receive(:find_finder_class_for).and_call_original
    model.valid?
  end
end

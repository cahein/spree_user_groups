require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::UserGroup do
  let(:user_group) { Spree::UserGroup.new }
  let(:calculator) { Spree::Calculator.new }

  context "shoulda validations" do
    it { should have_many(:users) }
  end

  describe "#save" do
    let(:user_group_valid) { Spree::UserGroup.new :name => "Wholesaler", calculator: calculator }

    context "when the object is invalid" do
      it { expect(user_group.save).to be false }
    end

    context "when the object is valid" do
      it { expect(user_group_valid.save).to be true }
    end
  end
end

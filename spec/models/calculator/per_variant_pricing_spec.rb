require File.dirname(__FILE__) + '/../../spec_helper'

describe 'Spree::Calculator::PerVariantPricing based on cost_price' do
  let(:user_group) { FactoryBot.create(:user_group, :name => 'Wholesaler')}
  let(:calculator) { Spree::Calculator::PerVariantPricing.new }

  let(:variant1) { FactoryBot.create(:variant, :cost_price => 3, :price => 5) }
  let(:variant2) { FactoryBot.create(:variant, :cost_price => 12, :price => 20) }
  let(:order) { FactoryBot.create(:order,
    :line_items => [
      FactoryBot.create(:line_item, :price => 5, :quantity => 2, :variant => variant1),
      FactoryBot.create(:line_item, :price => 20, :quantity => 1, :variant => variant2)
    ],
    :user => FactoryBot.create(:user, :user_group => user_group )
  )}

  before {
    Spree::UserGroupsVariant.create(:variant_id => variant1.id, :user_group_id => user_group.id, :price => 3)
    Spree::UserGroupsVariant.create(:variant_id => variant2.id, :user_group_id => user_group.id, :price => 18)
  }

  context "compute" do
    it "should compute amount correctly" do
      calculator.compute(order)
      expect(calculator.compute(order)).to eq(-6)
    end
  end
end

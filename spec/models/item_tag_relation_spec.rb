require 'rails_helper'

RSpec.describe ItemTagRelation, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_tag = FactoryBot.build(:item_tag_relation, user_id: user.id, item_id: item.id)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '全ての値が正しく入力されていれば、出品できる' do
        expect(@item_tag).to be_valid
      end
    end

    context '出品できない場合' do
      it 'tag_nameが空では、出品できない' do
        @item_tag.tag_name = ""
        @item_tag.valid?
        expect(@order_address.errors.full_messages).to include("Tag name can't be blank")
      end
    end
  end
end

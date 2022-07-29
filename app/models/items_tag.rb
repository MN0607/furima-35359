class ItemsTag

  include ActiveModel::Model
  attr_accessor :user_id, :trade_name, :explanation, :price, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :tag_name, :image
  with_options presence: true do
    validates :trade_name
    validates :explanation
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
    validates :tag_name

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: 'is out of setting range' }
  #validate :image_presence

  #def image_presence
    #errors.add(:image, "can't be blank") unless image.attached?
  #end

  def save
    item = Item.create(user_id: user_id, trade_name: trade_name, explanation: explanation, price: price, category_id: category_id, status_id: status_id, shipping_charge_id: shipping_charge_id, prefecture_id: prefecture_id, days_to_ship_id: days_to_ship_id, image: image)

    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end
end
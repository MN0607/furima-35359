class Item < ApplicationRecord
  with_options presence: true do
    validates :trade_name
    validates :explanation
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }

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
  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
end

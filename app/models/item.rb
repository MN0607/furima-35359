class Item < ApplicationRecord

  with_options presence: true do
    validates :trade_name
    validates :explanation
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }
    
    with_options numericality: { other_than: 1 , message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :days_to_ship_id 
    end
  end
    
  validate :image_presence

  def image_presence
    unless image.attached?
      errors.add(:image, "can't be blank")
    end
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

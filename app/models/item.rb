class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :days_ship
  belongs_to :status
  has_one :purchaser

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :days_ship_id
  end
end

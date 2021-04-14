class Orderpurchaser
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :adress, :building_name, :telephone, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :adress
    validates :token
    validates :telephone, format: { with: /\A\d{0,11}\z/ }
  end
  validates :area_id, numericality: { other_than: 1 }
  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, area_id: area_id, municipality: municipality, adress: adress,
                 building_name: building_name, area_id: area_id, telephone: telephone, purchaser_id: purchaser.id)
  end
end

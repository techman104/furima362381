class Form
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :address1, :address2, :purchase_record, :user_id, :item_id, :telephone,
                :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
    validates :city
    validates :address1
    validates :telephone, format: { with: /\A\d{11}\z/, message: 'is invalid' }
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, area_id: area_id, city: city, address1: address1, address2: address2,
                   order_id: order.id, telephone: telephone)
  end
end

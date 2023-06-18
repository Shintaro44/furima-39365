class OrderForm 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # paymentモデルのバリデーション
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'が無効です。ハイフン（-）を含めた形式で入力してください。' }
    validates :prefecture_id, numericality: { other_than: 0, message: "を入力してください。" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'を入力してください（正しい形式で入力してください）' }
    
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Payment.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end
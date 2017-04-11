class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  has_many :participated_users, through: :order_details,
                                class_name: 'User',
                                foreign_key: 'user_id'
  has_and_belongs_to_many :invited_users, class_name: 'User',
                                          foreign_key: 'order_id',
                                          join_table: :invitees_orders
  has_attached_file :image, styles: { large:"600x600>" ,medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

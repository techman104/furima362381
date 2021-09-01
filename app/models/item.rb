class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categry
  belongs_to :delivery
  belongs_to :are
  belongs_to :day
  belongs_to :status

  belongs_to :user

  validates :title, :text, presence: true
  validates :categry_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id, numericality: { other_than: 1 , message: "can't be blank"}
end

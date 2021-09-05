class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         with_options presence: true do
          validates :nickname
          validates :first_name
          validates :family_name
          validates :first_name_kana
          validates :family_name_kana
          validates :birth_day
         end
         with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
           validates :first_name
           validates :family_name
         end
         with_options format: { with: /\A[ァ-ヶ]+\z/, message: 'is invalid. Input full-width katakana characters' } do
           validates :first_name_kana
           validates :family_name_kana
         end  
           PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: ' invalid. Include both letters and numbers' 
              
end

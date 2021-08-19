class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, presence: true
  validates :password, length: { minimum: 6 }  
  # validates :encrypted_password,:password,:password_confirmation,length:{minimum:7},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  validates :password, confirmation: true
  validates :nickname, :family_name, presence: true
  validates :birth_year, presence: true
     
end

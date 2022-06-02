class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A([ぁ-んァ-ヶ一-龥々]|ー)+\z/, message: "を入力してください" }
    validates :first_name, format: { with: /\A([ぁ-んァ-ヶ一-龥々]|ー)+\z/, message: "を入力してください" }
    validates :last_name_katakana, format: { with: /\A([ァ-ン]|ー)+\z/, message: "を入力してください" }
    validates :first_name_katakana, format: { with: /\A([ァ-ン]|ー)+\z/, message: "を入力してください" }
    validates :birthday
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
  end
end

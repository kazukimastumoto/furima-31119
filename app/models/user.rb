class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  validates :email, uniqueness: true

  with_options presence: true do
    validates :birthday
    validates :nickname
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  has_many :items
end

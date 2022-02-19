class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :matters
  

  validates :nickname, presence: true
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と数字の両方を含めて設定してください'
  validates :profile, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :occupation, presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: '全角文字を使用してください' }
end

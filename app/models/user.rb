class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence:true
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/}
  
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :last_name
    validates :first_name 
  end

  with_options format:{ with: /\A[ァ-ヶー－]+\z/ } do
    validates :kana_last_name
    validates :kana_first_name
  end

  validates :birthday, presence: true

end

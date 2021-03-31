class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :name,format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
         validates :email
         validates :encrypted_password 
         validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
         validates :first_name_kana,format:{ with: /\A[ァ-ヶー－]+\z/ } 
         validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥々]/ } 
         validates :last_name_kana,format:{ with: /\A[ァ-ヶー－]+\z/ }
         validates :date 
      end

        

end

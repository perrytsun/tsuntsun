class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :consultations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_consultations, through: :likes, source: :consultation
  has_many :comments, dependent: :destroy
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 

  def already_liked?(consultation)
    self.likes.exists?(consultation_id: consultation.id)
end

end
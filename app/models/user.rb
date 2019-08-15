class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 30, message: "は30文字以内に抑えてください" }

  has_many :sinsis, dependent: :destroy
  has_many :comments

  def sinsis
    return Sinsi.where(user_id: self.id)
  end
end

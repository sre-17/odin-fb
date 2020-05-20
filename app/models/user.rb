class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts , dependent: :destroy
  has_many :comments
  
  has_many :likes
  has_many :liked_posts , through: :likes , source: :post
  
  has_many :og_requests, class_name: "Request" , foreign_key: :user_id
  has_many :ic_requests, class_name: "Request", foreign_key: :to_user_id
  
  has_many :self_confirmings  , class_name: "Friend" , foreign_key: :user_id
  has_many :they_confirmings , class_name: "Friend" , foreign_key: :friend_id
end

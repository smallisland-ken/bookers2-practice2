class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
        has_many :books, dependent: :destroy
        attachment :profile_image
        # attachmentタグは_idは不要
        validates :name, presence:true
        validates :introduction, length:{ maximum: 200 }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # validates :name, presence: true
  validates :email, :name, :sex, presence: true
  validates :password, presence: true, length: { minimum: 6},on: :create
  validates :introduce, length: { maximum: 255 }
  
  extend Enumerize
  # enum sex: {man: 0, woman: 1}
  enumerize :sex, in: {man: 0, woman: 1}

  # def update_without_current_password(params, *options)
  #   params.delete(:current_password)

  #   if params[:password].blank? && params[:password_confirmation].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation)
  #   end

  #   result = update_attributes(params, *options)
  #   clean_up_passwords
  #   result
  # end

  acts_as_followable 
  acts_as_follower
  belongs_to :prefecture, optional: true

  has_many :posts, dependent: :destroy
  has_many :chats,dependent: :destroy
  has_many :topics, dependent: :destroy

  def topics
    return Topic.where(user_id: self.id)
  end


end

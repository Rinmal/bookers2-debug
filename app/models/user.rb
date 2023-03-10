class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_one_attached :profile_image
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

# フォローする側
  has_many :relationships, foreign_key: :follower_id
  has_many :followers, through: :relationships, source: :followed

# フォローされる側
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :followed_id
  has_many :followeds, through: :reverse_of_relationships, source: :follower

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }



  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def is_followed_by?(user)
    reverse_of_relationships.find_by(follower_id: user.id).present?
  end

  def self.looks(method, word)
    if method == 'perfect_match'
      @user = self.where("name LIKE?","#{word}")
    elsif method == 'forward_match'
      @user = self.where("name LIKE?","#{word}%")
    elsif method == 'behind_match'
      @user = self.where("name LIKE?","%#{word}")
    elsif method == 'part_match'
      @user = self.where("name LIKE?","%#{word}%")
    end
  end
end

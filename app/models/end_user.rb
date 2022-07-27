class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :submissions, dependent: :destroy
  has_many :comments,    dependent: :destroy
  has_many :favorites,   dependent: :destroy

   validates :name, uniqueness: true, length: {in: 2..20}
   validates :introduction, length: {maximum:50}

  def get_profile_image
   unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
  profile_image.variant(resize_to_limit: [100, 100]).processed
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @end_user = EndUser.where("name LIKE?", "#{word}")

    elsif search == "forward_match"
      @end_user = EndUser.where("name LIKE?","#{word}%")

    elsif search == "backward_match"
      @end_user = EndUser.where("name LIKE?","%#{word}")

    elsif search == "partial_match"
      @end_user = EndUser.where("name LIKE?","%#{word}%")

    else
      @end_user = EndUser.all
    end
  end
end

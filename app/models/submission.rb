class Submission < ApplicationRecord

  has_one_attached :image
  belongs_to :end_user
  has_many :comments,        dependent: :destroy
  has_many :favorites,       dependent: :destroy
  has_many :submission_tags, dependent: :destroy
  has_many :tags,            through: :submission_tags
  
   def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
   end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @submission = Submission.where("body LIKE?","#{word}")

    elsif search == "forward_match"
      @submission = Submission.where("body LIKE?","#{word}%")

    elsif search == "backward_match"
      @submission = Submission.where("body LIKE?","%#{word}")

    elsif search == "partial_match"
      @submission = Submission.where("body LIKE?","%#{word}%")

    else
      @submission = Submission.all
    end
  end
end

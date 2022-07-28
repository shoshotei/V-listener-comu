class Tag < ApplicationRecord
  has_many :submission_tags, dependent: :destroy
  has_many :submissions, through: :submission_tags
end

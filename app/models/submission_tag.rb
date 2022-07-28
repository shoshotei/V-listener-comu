class SubmissionTag < ApplicationRecord
  attribute :tag_ids
  belongs_to :submission
  belongs_to :tag
end

class CreateSubmissionTags < ActiveRecord::Migration[6.1]
  def change
    create_table :submission_tags do |t|

      t.integer :submission_id, null: false
      t.integer :tag_id,        null: false
      t.timestamps

      t.index ["submission_id"], name: "index_submission_tags_on_submission_id"
      t.index ["tag_id"],        name: "index_submission_tags_on_tag_id"
    end
  end
end

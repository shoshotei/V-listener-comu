class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|

      t.integer :end_user_id, null: false
      t.string :body,         null: false
      t.timestamps
    end
  end
end

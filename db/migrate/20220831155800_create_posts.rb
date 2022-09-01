class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.integer :comment_count

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.integer "user_id", null: false
      t.integer "recommendation_id", null: false
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["recommendation_id"], name: "index_comments_on_recommendation_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
    end
  end
end

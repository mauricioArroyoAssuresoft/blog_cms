class AddStatusToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column(:posts, :status, :string, default: "draft", null: false)
  end
end

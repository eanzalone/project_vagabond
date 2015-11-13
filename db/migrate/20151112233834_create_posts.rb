class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.array :tags
      t.string :location

      t.timestamps null: false

      validates :title, presence: true, length: { maximum: 25 }
    end
  end
end

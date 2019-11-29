class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :status
      t.text :articule

      t.timestamps
    end
  end
end

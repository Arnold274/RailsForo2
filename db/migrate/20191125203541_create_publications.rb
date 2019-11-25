class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.integer :status
      t.string :articule

      t.timestamps
    end
  end
end

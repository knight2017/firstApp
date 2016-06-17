class CreateThems < ActiveRecord::Migration
  def change
    create_table :thems do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end

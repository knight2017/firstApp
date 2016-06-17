class CreateAausers < ActiveRecord::Migration
  def change
    create_table :aausers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end

    add_index :aausers, :email, unique: true
  end
end
